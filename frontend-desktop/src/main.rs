use rust_socketio::{Client, ClientBuilder, Payload};
use serde::Deserialize;
use serde_json::{json, Value};
use slint::{Timer, TimerMode};
use std::sync::Arc;
use std::{
    rc::Rc,
    sync::{Mutex, MutexGuard},
};

slint::slint!(import { MainWindow } from "src/ui/MainWindow.slint";);

#[derive(Deserialize, Debug)]
struct ReceivedMessage {
    name: String,
    #[serde(rename="type")]
    message_type: String,
}

static MUTEX: Mutex<Option<ReceivedMessage>> = Mutex::new(None);

fn receive_string_message(data: &str, _socket: Client) {
    let received_message: ReceivedMessage = serde_json::from_str(data).unwrap();
    let mut guard: MutexGuard<'_, Option<ReceivedMessage>> = MUTEX.lock().unwrap();
    *guard = Some(received_message);
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

fn wsconnect() -> Client {
    // get a socket that is connected to the admin namespace
    let socket = ClientBuilder::new("http://localhost:4200")
        .namespace("/")
        .on("coffee", receive_message)
        .on("error", websocket_error)
        .connect()
        .expect("Connection failed");
    return socket;
}

fn text_for_message(message: &ReceivedMessage) -> &'static str {
    match message.message_type.as_str() {
        "join" => return "wants to go for a coffee",
        "leave" => return "decided against getting a coffee",
        "start" => return "-> Let's go!",
        _ => eprintln!(
            "Incorrect message type received: {:#?}",
            message.message_type
        ),
    }
    return "";
}

fn send(websocket: &Client, data: Value, event: &str) {
    websocket.emit(event, data).expect("Socket down");
}

fn main() {
    let ui: MainWindow = MainWindow::new();
    let websocket_client = Arc::new(wsconnect());

    let timer = Timer::default();

    let history_model = Rc::new(slint::VecModel::<HistoryItem>::from(vec![
        //HistoryItem { text: "wants to get a coffee".into(), user: "Foo".into() },
    ]));

    let main_window_weak = ui.as_weak();
    let history_model_clone = history_model.clone();
    timer.start(
        TimerMode::Repeated,
        std::time::Duration::from_millis(2),
        move || {
            let mut guard: MutexGuard<'_, Option<ReceivedMessage>> = MUTEX.lock().unwrap();
            if let Some(item) = &*guard {
                let history_item: HistoryItem = HistoryItem {
                    text: text_for_message(item).into(),
                    user: item.name.clone().into(),
                };
                history_model_clone.push(history_item);
                *guard = None;
            }
        },
    );
    ui.on_call({
        let websocket_client = websocket_client.clone();
        move || {
            let json_payload = json!({"name": "RustCoffee", "type": "join"});
            send(&websocket_client, json_payload, "coffee");
        }
    });
    ui.on_go({
        let websocket_client = websocket_client.clone();
        move || {
            let json_payload = json!({"name": "RustCoffee", "type": "start"});
            send(&websocket_client, json_payload, "coffee");
        }
    });
    ui.on_leave({
        let websocket_client = websocket_client.clone();
        move || {
            let json_payload = json!({"name": "RustCoffee", "type": "leave"});
            send(&websocket_client, json_payload, "coffee");
        }
    });
    ui.on_add_entry({
        let history_model = history_model.clone();
        move |user, text| {
            let new_element = HistoryItem {
                text: text,
                user: user,
            };
            history_model.push(new_element);
        }
    });

    ui.set_history_model(history_model.into());

    ui.run();
}
