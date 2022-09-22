use rust_socketio::{Client, ClientBuilder, Payload, Error};
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use slint::{Timer, TimerMode, Weak};
use std::fs::OpenOptions;
use std::io::Write;
use std::sync::Arc;
use std::{
    rc::Rc,
    sync::{Mutex, MutexGuard},
};
use config::{Config, ConfigError};

slint::include_modules!();

#[derive(Deserialize, Debug)]
struct TimedCommand {
    name: String,
    #[serde(rename = "type")]
    message_type: String,
    #[serde(rename = "broadcastAt")]
    broadcast_at: chrono::DateTime<chrono::Utc>,
}

#[derive(Deserialize, Debug)]
struct CoffeeCall {
    status: String,
    participants: Vec<String>,
    messages: Vec<TimedCommand>,
}

static MUTEX: Mutex<Option<CoffeeCall>> = Mutex::new(None);

fn receive_string_message(data: &str, _socket: Client) {
    let received_message: CoffeeCall = serde_json::from_str(data).unwrap();
    let mut guard: MutexGuard<'_, Option<CoffeeCall>> = MUTEX.lock().unwrap();
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

fn wsconnect(address: &str) -> Option<Client> {
    // get a socket that is connected to the admin namespace
    let socket = ClientBuilder::new(address)
        .namespace("/")
        .on("coffeeCall", receive_message)
        .on("error", websocket_error)
        .connect();
    match socket {
        Ok(s) => return Some(s),
        Err(_) => return None,
    }
}

fn text_for_call(call: &CoffeeCall) -> &'static str {
    match call.status.as_str() {
        "announced" => return "coffee call was announced",
        "inProgress" => return "coffee call was started",
        "cancelled" => return "coffee call was cancelled",
        "inactive" => return "no coffee call atm",
        _ => eprintln!("Incorrect call status received: {:#?}", call.status),
    }
    return "";
}

fn text_for_message(message: &TimedCommand) -> &'static str {
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

#[derive(Debug, Deserialize, Serialize)]
struct CoffeeCallerConfig {
    username: String,
    server: String,
}

fn read_config(path: &str) -> Result<CoffeeCallerConfig, ConfigError> {
    let settings = Config::builder()
        .add_source(config::File::with_name(path))
        .add_source(config::Environment::with_prefix("COFFEE"))
        .build()
        .unwrap_or_default();    
    return settings.try_deserialize();
}

fn create_default_config() -> CoffeeCallerConfig {
    let default_config: CoffeeCallerConfig = CoffeeCallerConfig {
        username: "RustCoffee".into(),
        server: "http://localhost:4200".into(),
    };
    return default_config;
}

fn disable_buttons(ui: Weak<MainWindow>) {
    ui.unwrap().invoke_set_buttons(false);
}

fn enable_buttons(ui: Weak<MainWindow>) {
    ui.unwrap().invoke_set_buttons(true);
}

fn main() {

    let config = read_config("./config");
    let config = match config {
        Ok(some) => some,
        Err(_) => create_default_config(),
    };
    
    let config = Arc::new(config);
    let ui: MainWindow = MainWindow::new();
    let websocket_client = Arc::new(wsconnect(&config.server));

    let timer = Timer::default();

    let history_model = Rc::new(slint::VecModel::<HistoryItem>::from(vec![
        //HistoryItem { text: "wants to get a coffee".into(), user: "Foo".into() },
    ]));

    let main_window_weak = ui.as_weak();
    {
        let websocket_client = websocket_client.clone();
        match websocket_client.as_ref() {
            Some(_) => (),
            None => disable_buttons(main_window_weak),
        }
    }
    let history_model_clone = history_model.clone();
    timer.start(
        TimerMode::Repeated,
        std::time::Duration::from_millis(1),
        move || {
            let mut guard: MutexGuard<'_, Option<CoffeeCall>> = MUTEX.lock().unwrap();
            if let Some(item) = &*guard {
                while slint::Model::row_count(&history_model_clone) > 0 {
                    history_model_clone.remove(0);
                }
                for message in &item.messages {
                    let history_item: HistoryItem = HistoryItem {
                        text: text_for_message(&message).into(),
                        user: message.name.clone().into(),
                    };
                    history_model_clone.push(history_item);
                }
                *guard = None;
            }
        },
    );
    ui.on_call({
        let websocket_client = websocket_client.clone();
        let config = config.clone();
        move || {
            let json_payload = json!({"name": &config.username, "type": "join"});
            match websocket_client.as_ref() {
                Some(x) => send(x, json_payload, "coffeeRequest"),
                None => (),
            }
        }
    });
    ui.on_go({
        let websocket_client = websocket_client.clone();
        let config = config.clone();
        move || {

            let json_payload = json!({"name": &config.username, "type": "start"});
            match websocket_client.as_ref() {
                Some(x) => send(x, json_payload, "coffeeRequest"),
                None => (),
            }
        }
    });
    ui.on_save_and_reconnect({
        let main_window_weak = ui.as_weak();
        let config = config.clone();
        move |name, address| {
            let new_config = CoffeeCallerConfig { username: name.as_str().into(), server: address.as_str().into() };
            let toml = toml::to_string(&new_config).unwrap();
            let file = OpenOptions::new().write(true).create(true).truncate(true).open("config.toml");
            match file {
                Ok(mut x) => x.write_all(toml.as_bytes()).unwrap(),
                Err(_) => eprintln!("Couldn't write config file"),
            }
            match slint::quit_event_loop() {
                Ok(_) => (),
                Err(x) => eprintln!("{:#?}", x)
            }
        }
    });
    ui.on_leave({
        let websocket_client = websocket_client.clone();
        let config = config.clone();
        move || {
            let json_payload = json!({"name": &config.username, "type": "leave"});
            match websocket_client.as_ref() {
                Some(x) => send(x, json_payload, "coffeeRequest"),
                None => (),
            }
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
