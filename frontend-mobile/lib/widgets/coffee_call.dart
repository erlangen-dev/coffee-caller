import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/widgets/coffee_cup_logo.dart';
import 'package:coffee_caller/widgets/connect_status_icon.dart';
import 'package:coffee_caller/widgets/cubit/coffee_call_cubit.dart';
import 'package:coffee_caller/widgets/cubit/coffee_call_state.dart';
import 'package:coffee_caller/widgets/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCall extends StatelessWidget {
  const CoffeeCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CoffeeCallCubit(
            protocol: CoffeeCallerProtocol(
                socketClient: context.read<SocketClient>())),
        child: const CoffeeCallBody());
  }
}

class CoffeeCallBody extends StatefulWidget {
  const CoffeeCallBody({super.key});

  @override
  State<StatefulWidget> createState() => _CoffeeCallBody();
}

class _CoffeeCallBody extends State<CoffeeCallBody> {
  @override
  void initState() {
    super.initState();
    var serverUrl = context.read<SettingsCubit>().state.serverUrl;
    context.read<CoffeeCallCubit>().init(serverUrl);
  }

  void _onCoffeeCupClicked(BuildContext context, String username) {
    context.read<CoffeeCallCubit>().next(username);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeCallCubit, CoffeeCallState>(
      builder: (context, state) {
        return Padding(
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
                    child: CoffeeCupLogo(
                        onClick: () => _onCoffeeCupClicked(context,
                            context.read<SettingsCubit>().state.username)),
                  ),
                ],
              ),
              Card(
                margin: const EdgeInsets.all(10),
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'CoffeeCall: ${state.coffeeCall.status.name}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  final message = state.coffeeCall.messages[index];
                  final localDate = message.broadcastAt.toLocal();
                  final hour = localDate.hour.toString().padLeft(2, '0');
                  final minute = localDate.minute.toString().padLeft(2, '0');
                  final second = localDate.second.toString().padLeft(2, '0');
                  final time = '$hour:$minute:$second';

                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${message.name} ${message.type.name}s a coffee call @$time',
                      ),
                    ),
                  );
                },
                padding: const EdgeInsets.all(10),
                itemCount: state.coffeeCall.messages.length,
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
