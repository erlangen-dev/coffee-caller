import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_caller/view/cubit/coffee_call_state.dart';
import 'package:coffee_caller/communication/socket_client.dart';

class CoffeeCallCubit extends Cubit<CoffeeCallState> {
  SocketClient socket;

  late StreamSubscription connectionStatusSubscription;
  late StreamSubscription coffeeMessageSubscription;

  CoffeeCallCubit({
    required this.socket,
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

    socket.coffeeMessageStream.listen((message) {
      emit(state.copyWith(messages: [...state.messages, message]));
    });
  }

  void connect() {
    socket.init();
  }

  void sendMessage() {
    socket.sendMessage();
  }
}
