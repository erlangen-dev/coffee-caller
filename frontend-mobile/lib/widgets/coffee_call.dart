import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:coffee_caller/widgets/coffee_cup_logo.dart';
import 'package:coffee_caller/widgets/connect_status_icon.dart';
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
        protocol: CoffeeCallerProtocol(
          socketClient: context.read<SocketClient>(),
        ),
      )..init(),
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
    return BlocBuilder<CoffeeCallCubit, CoffeeCallState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child:
                        ConnectStatusIcon(connectStatus: state.connectStatus),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CoffeeCupLogo(onClick: _onCoffeeCupClicked),
                  ),
                ],
              ),
              Card(
                margin: const EdgeInsets.all(10),
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'CoffeeCall: ${state.status.name}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(state.messages[index]),
                    ),
                  );
                },
                padding: const EdgeInsets.all(10),
                itemCount: state.messages.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
