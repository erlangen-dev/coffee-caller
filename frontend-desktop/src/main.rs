use rust_socketio::{ClientBuilder, Payload, Client};
use serde_json::json;
use serde::Deserialize;
use std::{rc::Rc, sync::{Mutex, MutexGuard}};
use slint::{Timer, TimerMode};


slint::slint!(import { MainWindow } from "src/ui/MainWindow.slint";);

#[derive(Deserialize, Debug)]
struct JoinMessage {
    name: String,
}

static mutex: Mutex<Option<JoinMessage>> = Mutex::new(None);

fn receive_string_message(data: &str, _socket: Client) {
    let join_message: JoinMessage = serde_json::from_str(data).unwrap();
    let mut guard: MutexGuard<'_, Option<JoinMessage>> = mutex.lock().unwrap();
    *guard = Some(join_message);
}

fn receive_message(payload: Payload, _socket: Client) {
    match payload {
        Payload::String(str) => receive_string_message(&str, _socket),
        Payload::Binary(bin_data) => println!("Received bytes: {:#?}", bin_data),
    }
}

fn websocket_error(payload: Payload, _: Client) {
    match payload {
        Payload::String(str) => eprintln!("Error: {:#?}", str),
        Payload::Binary(bin_data) => eprintln!("Error: {:#?}", bin_data),
    }
}

fn wsconnect() -> Client{
    // get a socket that is connected to the admin namespace
    let socket = ClientBuilder::new("http://localhost:4200")
        .namespace("/")
        .on("coffee", receive_message)
        .on("error", websocket_error)
        .connect()
        .expect("Connection failed");
    return socket
}

fn main() {
    let ui: MainWindow = MainWindow::new();
    let websocket_client = wsconnect();

    let timer = Timer::default();

    let history_model = Rc::new(slint::VecModel::<HistoryItem>::from(vec![
        //HistoryItem { text: "wants to get a coffee".into(), user: "Foo".into() },
    ]));


    let main_window_weak = ui.as_weak();
    let history_model_clone = history_model.clone();
    timer.start(TimerMode::Repeated, std::time::Duration::from_millis(2), move || {
        let mut guard: MutexGuard<'_, Option<JoinMessage>> = mutex.lock().unwrap();
        if let Some(item) = &*guard {
            let history_item: HistoryItem = HistoryItem { text: "wants to go for a coffee".into(), user: item.name.clone().into() };
            history_model_clone.push(history_item);
            *guard = None;
        }
    });
    ui.on_call(move || {
            let json_payload = json!({"name": "RustCoffee"});
            main_window_weak.unwrap().invoke_add_entry("RustCoffee".into(), "wants to get a coffee".into());
            websocket_client.emit("coffee", json_payload).expect("Socket down")
        }
    );
    
    ui.on_add_entry({
        let history_model = history_model.clone();
        move |user, text| {
            let new_element = HistoryItem { text: text, user: user };
            history_model.push(new_element);
        }
    });

    ui.set_history_model(history_model.into());


    ui.run();
}
