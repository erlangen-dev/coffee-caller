import 'package:coffee_caller/socket_client.dart';
import 'package:flutter/material.dart';

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
  List<String> messages = [];
  final SocketClient client = SocketClient();

  @override
  void initState() {
    super.initState();
    client.init();
    client.subscribeForCoffeeCalls((data) {
      setState(() {
        messages.add(data);
      });
    });
  }

  void _sendMessage() {
    client.sendMessage();
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
            TextButton(onPressed: _sendMessage, child: const Text('Send msg')),
            ListView.builder(
              itemBuilder: (BuildContext context, index) {
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
