import 'package:coffee_caller/environment.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/screens/home_screen.dart';
import 'package:coffee_caller/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      theme: appTheme,
      home: Provider.value(
        value: socketClient,
        child: const HomeScreen(),
      ),
    );
  }
}
