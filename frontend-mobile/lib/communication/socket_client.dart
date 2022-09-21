import 'dart:async';

import 'package:coffee_caller/communication/models/coffee_call.dart';
import 'package:coffee_caller/communication/models/coffee_caller_command.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

enum SocketConnectStatus { unknown, disconnected, connecting, connected, error }

class SocketClient {
  Stream<CoffeeCall> get coffeeCallsStream =>
      _coffeeCallMessagesController.stream;

  SocketClient(String serverUrl)
      : _socket = socket_io.io(serverUrl, <String, dynamic>{
          'autoConnect': false,
          'transports': ['websocket']
        });

  final socket_io.Socket _socket;
  final _statusController = StreamController<SocketConnectStatus>();
  final _coffeeCallMessagesController = StreamController<CoffeeCall>();

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

    _socket.on('coffeeCalls', (incomingData) {
      print(incomingData);
      _coffeeCallMessagesController.sink.add(CoffeeCall.fromJson(incomingData));
    });

    return _statusController.stream;
  }

  void sendMessage(CoffeeCallerCommand message) {
    if (!_socket.connected) return;

    _socket.emit('coffee', message);
  }
}
