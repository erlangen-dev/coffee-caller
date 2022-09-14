//use rust_socketio::{ClientBuilder, Payload, Client};
//use serde_json::json;
use std::rc::Rc;

slint::slint!(import { MainWindow } from "src/ui/MainWindow.slint";);

/*fn receive_message(payload: Payload, _socket: Client) {
    match payload {
        Payload::String(str) => println!("Received: {}", str),
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
        .on("message", receive_message)
        .on("error", websocket_error)
        .connect()
        .expect("Connection failed");
    return socket
}*/

fn call(ui: MainWindow) {
    ui.invoke_add_entry("Mustermann".into(), "wants to get a coffee".into());
}

fn main() {
    let ui = MainWindow::new();

    let history_model = Rc::new(slint::VecModel::<HistoryItem>::from(vec![
        //HistoryItem { text: "wants to get a coffee".into(), user: "Foo".into() },
    ]));

    let main_window_weak = ui.as_weak();
    ui.on_call(move || {
            call(main_window_weak.unwrap());   
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
    /*let websocket_client = wsconnect();

    let mut counter = 0;
    loop {
        let json_payload = json!({"name": "RustCoffeeBot", "counter": counter});
        websocket_client.emit("coffee", json_payload).expect("Server unreachable");
        println!("Emitted: {}", counter);
        let ten_millis = time::Duration::from_millis(1000);
        thread::sleep(ten_millis);
        counter += 1;
    }*/
}
