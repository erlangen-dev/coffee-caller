import 'dart:convert';

import 'package:coffee_caller/communication/models/coffee_caller_message.dart';
import 'package:coffee_caller/communication/socket_client.dart';

class CoffeeCallerProtocol {
  final SocketClient socketClient;

  const CoffeeCallerProtocol({required this.socketClient});

  void join(String username) {
    _send(CoffeeCallerMessageType.join, username);
  }

  void start(String username) {
    _send(CoffeeCallerMessageType.start, username);
  }

  void leave(String username) {
    _send(CoffeeCallerMessageType.leave, username);
  }

  void _send(CoffeeCallerMessageType type, String username) {
    final message = CoffeeCallerMessage(type, username);
    socketClient.sendMessage(jsonEncode(message));
  }
}
