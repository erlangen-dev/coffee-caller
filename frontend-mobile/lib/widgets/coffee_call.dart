import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:coffee_caller/widgets/no_username.dart';
import 'package:coffee_caller/widgets/cubit/coffee_call_cubit.dart';
import 'package:coffee_caller/widgets/cubit/coffee_call_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCall extends StatelessWidget {
  const CoffeeCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CoffeeCallCubit(
        socket: context.read<SocketClient>(),
        protocol: CoffeeCallerProtocol(
          socketClient: context.read<SocketClient>(),
        ),
      )
        ..init()
        ..connect(),
      child: const CoffeeCallBody(),
    );
  }
}

class CoffeeCallBody extends StatefulWidget {
  const CoffeeCallBody({super.key});

  @override
  State<StatefulWidget> createState() => _CoffeeCallBodyState();
}

class _CoffeeCallBodyState extends State<CoffeeCallBody> {
  late String userName = '';

  @override
  void initState() {
    super.initState();
    _setUsername();
  }

  void _setUsername() {
    getUsername().then((value) {
      setState(() {
        userName = value;
      });
    });
  }

  void _onCoffeeCupClicked() {
    context.read<CoffeeCallCubit>().next();
  }

  @override
  Widget build(BuildContext context) {
    if (userName == '') {
      return NoUsername(onUsernameSet: _setUsername);
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Hero(
            tag: 'coffee-cup',
            child: Material(
              child: ElevatedButton(
                onPressed: _onCoffeeCupClicked,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(48),
                ),
                child: Image.asset('assets/coffee_cup.png',
                    height: 200, width: 200),
              ),
            ),
          ),
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
        ),
      ],
    );
  }
}
