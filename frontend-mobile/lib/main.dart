import 'package:coffee_caller/cubit/coffee_call_cubit.dart';
import 'package:coffee_caller/cubit/coffee_call_state.dart';
import 'package:coffee_caller/environment.dart';
import 'package:coffee_caller/socket_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (_) => CoffeeCallCubit(socket: socketClient)
          ..init()
          ..connect(),
        child: const Home(title: 'Coffee Caller - Home'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: context.read<CoffeeCallCubit>().sendMessage,
            child: const Text('Send msg'),
          ),
          BlocBuilder<CoffeeCallCubit, CoffeeCallState>(
            builder: (context, state) {
              return ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Text(state.messages[index]);
                },
                padding: const EdgeInsets.all(5),
                itemCount: state.messages.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              );
            },
          )
        ],
      ),
    );
  }
}
