import 'dart:async';
import 'dart:convert';

import 'package:coffee_caller/communication/models/coffee_caller_command.dart';
import 'package:coffee_caller/communication/socket_client.dart';

class CoffeeCallerProtocol {
  Stream<TimedCoffeeCallerCommand> get messages =>
      _socketClient.coffeeMessage.map(_decodeRawMessage);

  CoffeeCallerProtocol({required SocketClient socketClient})
      : _socketClient = socketClient;

  final SocketClient _socketClient;

  Stream<SocketConnectStatus> connect() => _socketClient.connect();

  void join(String username) {
    _send(CoffeeCallerCommandType.join, username);
  }

  void start(String username) {
    _send(CoffeeCallerCommandType.start, username);
  }

  void leave(String username) {
    _send(CoffeeCallerCommandType.leave, username);
  }

  void _send(CoffeeCallerCommandType type, String username) {
    final message = CoffeeCallerCommand(type, username);
    _socketClient.sendMessage(jsonEncode(message));
  }

  TimedCoffeeCallerCommand _decodeRawMessage(String rawMessage) {
    return TimedCoffeeCallerCommand.fromJson(jsonDecode(rawMessage));
  }
}
