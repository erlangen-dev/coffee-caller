import 'package:bloc/bloc.dart';
import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/models/coffee_call.dart';
import 'package:coffee_caller/widgets/cubit/coffee_call_state.dart';

class CoffeeCallCubit extends Cubit<CoffeeCallState> {
  CoffeeCallerProtocol protocol;

  CoffeeCallCubit({
    required this.protocol,
  }) : super(const CoffeeCallState());

  void init() {
    protocol.coffeeCalls.listen((message) {
      emit(state.copyWith(coffeeCall: message));
    });

    protocol
        .connect()
        .listen((status) => emit(state.copyWith(connectStatus: status)));
  }

  void next(String username) {
    if (state.coffeeCall.status == CoffeeCallStatus.inactive) {
      protocol.join(username);
      return;
    }
    if (state.coffeeCall.status == CoffeeCallStatus.announced) {
      protocol.start(username);
      return;
    }
    protocol.leave(username);
  }
}
