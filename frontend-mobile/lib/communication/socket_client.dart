import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import 'models/coffee_caller_message.dart';

enum SocketConnectStatus { unknown, disconnected, connecting, connected, error }

class SocketClient {
  Stream<ReceivedCoffeeCallerMessage> get coffeeMessage =>
      _coffeeMessageController.stream;

  SocketClient(String serverUrl)
      : _socket = socket_io.io(serverUrl, <String, dynamic>{
          'autoConnect': false,
          'transports': ['websocket']
        });

  final socket_io.Socket _socket;
  final _statusController = StreamController<SocketConnectStatus>();
  final _coffeeMessageController =
      StreamController<ReceivedCoffeeCallerMessage>();

  Stream<SocketConnectStatus> connect() {
    _statusController.sink.add(SocketConnectStatus.connecting);
    _socket.connect();

    _socket.onConnect((_) {
      _statusController.sink.add(SocketConnectStatus.connected);
    });
    _socket.onDisconnect(
      (_) => _statusController.sink.add(SocketConnectStatus.disconnected),
    );

    _socket.onConnectError(
      (err) => _statusController.sink.add(SocketConnectStatus.error),
    );
    _socket.onError(
      (err) => _statusController.sink.add(SocketConnectStatus.error),
    );

    _socket.on('coffee', (dynamic data) {
      _coffeeMessageController.sink
          .add(ReceivedCoffeeCallerMessage.fromJson(data));
    });
    return _statusController.stream;
  }

  void sendMessage(CoffeeCallerMessage message) {
    if (!_socket.connected) return;

    _socket.emit('coffee', message);
  }
}
