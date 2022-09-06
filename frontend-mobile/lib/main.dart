import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Caller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Coffee Caller - Home'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late IO.Socket socket;
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  void initSocket() {
    socket = IO.io("ws://localhost:4200/", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.on("coffee", (data) {
      print("Got coffee call");
      setState(() {
        messages.add("Got coffee call");
      });
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }

  void _sendMessage() {
    print("Send msg");
    socket.emit("coffee", "Lets go");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: _sendMessage, child: Text("Send msg")),
            ListView.builder(
              itemBuilder: (BuildContext, index) {
                return Text(messages[index]);
              },
              padding: const EdgeInsets.all(5),
              itemCount: messages.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
