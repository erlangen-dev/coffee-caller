import 'dart:async';
import 'dart:convert';

import 'package:coffee_caller/communication/models/coffee_caller_message.dart';
import 'package:coffee_caller/communication/socket_client.dart';

class CoffeeCallerProtocol {
  Stream<CoffeeCallerMessage> get messages =>
      _socketClient.coffeeMessageStream.map(_decodeRawMessage);

  CoffeeCallerProtocol({required SocketClient socketClient})
      : _socketClient = socketClient;

  final SocketClient _socketClient;

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
    _socketClient.sendMessage(jsonEncode(message));
  }

  CoffeeCallerMessage _decodeRawMessage(String rawMessage) {
    return CoffeeCallerMessage.fromJson(jsonDecode(rawMessage));
  }
}
