import 'package:coffee_caller/socket_client.dart';
import 'package:coffee_caller/view/cubit/coffee_call_cubit.dart';
import 'package:coffee_caller/view/cubit/coffee_call_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCallScreen extends StatelessWidget {
  final SocketClient socketClient;

  const CoffeeCallScreen({
    super.key,
    required this.socketClient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Caller'),
      ),
      body: BlocProvider(
        create: (_) => CoffeeCallCubit(socket: socketClient)
          ..init()
          ..connect(),
        child: const CoffeeCallBody(),
      ),
    );
  }
}

class CoffeeCallBody extends StatelessWidget {
  const CoffeeCallBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
