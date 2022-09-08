import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/socket_client.dart';
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
        create: (_) => CoffeeCallCubit(
          socket: socketClient,
          protocol: CoffeeCallerProtocol(socketClient: socketClient),
        )
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
        Row(
          children: [
            TextButton(
              onPressed: context.read<CoffeeCallCubit>().join,
              child: const Text('Join'),
            ),
            TextButton(
              onPressed: context.read<CoffeeCallCubit>().leave,
              child: const Text('Leave'),
            ),
            TextButton(
              onPressed: context.read<CoffeeCallCubit>().start,
              child: const Text('Start'),
            ),
          ],
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
