import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

enum SocketClientConnectStatus { disconnected, connecting, connected, error }

class SocketClient {
  Stream<SocketClientConnectStatus> get connectStatusStream =>
      _statusController.stream;

  Stream<String> get coffeeMessageStream => _coffeeMessageController.stream;

  SocketClient(String serverUrl)
      : _socket = socket_io.io(serverUrl, <String, dynamic>{
          'autoConnect': false,
          'transports': ['websocket']
        });

  final socket_io.Socket _socket;
  final _statusController = StreamController<SocketClientConnectStatus>();
  final _coffeeMessageController = StreamController<String>();

  void init() {
    _statusController.sink.add(SocketClientConnectStatus.connecting);
    _socket.connect();

    _socket.onConnect((_) {
      _statusController.sink.add(SocketClientConnectStatus.connected);
    });
    _socket.onDisconnect(
      (_) => _statusController.sink.add(SocketClientConnectStatus.disconnected),
    );

    _socket.onConnectError(
      (err) => _statusController.sink.add(SocketClientConnectStatus.error),
    );
    _socket.onError(
      (err) => _statusController.sink.add(SocketClientConnectStatus.error),
    );

    _socket.on('coffee', (data) => _coffeeMessageController.sink.add(data));
  }

  void sendMessage(String message) {
    if (!_socket.connected) return;

    _socket.emit('coffee', message);
  }
}
