import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:coffee_caller/widgets/cubit/coffee_call_state.dart';
import 'package:coffee_caller/communication/socket_client.dart';

class CoffeeCallCubit extends Cubit<CoffeeCallState> {
  SocketClient socket;
  CoffeeCallerProtocol protocol;

  late StreamSubscription connectionStatusSubscription;
  late StreamSubscription coffeeMessageSubscription;

  CoffeeCallCubit({
    required this.socket,
    required this.protocol,
  }) : super(const CoffeeCallState());

  void init() {
    socket.connectStatusStream.listen((status) {
      switch (status) {
        case SocketClientConnectStatus.disconnected:
          emit(state.copyWith(status: CoffeeCallStatus.disconnected));
          break;
        case SocketClientConnectStatus.connected:
          emit(state.copyWith(status: CoffeeCallStatus.connected));
          break;
        case SocketClientConnectStatus.error:
          emit(state.copyWith(status: CoffeeCallStatus.disconnected));
          break;
        case SocketClientConnectStatus.connecting:
          // do nothing
          break;
      }
    });

    protocol.messages.listen((message) {
      final localDate = message.broadcastAt.toLocal();
      final hour = localDate.hour.toString().padLeft(2, '0');
      final minute = localDate.minute.toString().padLeft(2, '0');
      final second = localDate.second.toString().padLeft(2, '0');
      final time = '$hour:$minute:$second';

      emit(state.copyWith(messages: [
        ...state.messages,
        '${message.name} ${message.type.name}s a coffee call @$time',
      ]));
    });
  }

  void connect() {
    socket.init();
  }

  void join() async {
    protocol.join(await getUsername());
  }

  void start() async {
    protocol.start(await getUsername());
  }

  void leave() async {
    protocol.leave(await getUsername());
  }
}
