import 'package:coffee_caller/environment.dart';
import 'package:coffee_caller/socket_client.dart';
import 'package:coffee_caller/view/coffee_call_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final socketClient = SocketClient(Environment.backendUrl);
  runApp(App(socketClient: socketClient));
}

class App extends StatelessWidget {
  final SocketClient socketClient;

  const App({super.key, required this.socketClient});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Caller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoffeeCallScreen(
        socketClient: socketClient,
      ),
    );
  }
}
