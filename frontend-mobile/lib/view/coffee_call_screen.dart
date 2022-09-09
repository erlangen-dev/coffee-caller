import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/view/cubit/coffee_call_cubit.dart';
import 'package:coffee_caller/view/cubit/coffee_call_state.dart';
import 'package:coffee_caller/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCallScreen extends StatelessWidget {
  const CoffeeCallScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Caller'),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings),
            label: const Text('Settings'),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => CoffeeCallCubit(
          socket: context.read<SocketClient>(),
          protocol: CoffeeCallerProtocol(
            socketClient: context.read<SocketClient>(),
          ),
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
