import 'package:bloc/bloc.dart';
import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/models/coffee_call.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
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

  void next() {
    if (state.coffeeCall.status == CoffeeCallStatus.inactive) {
      _join();
      return;
    }
    if (state.coffeeCall.status == CoffeeCallStatus.announced) {
      _start();
      return;
    }
    _leave();
  }

  void _join() async {
    protocol.join(await getUsername());
  }

  void _start() async {
    protocol.start(await getUsername());
  }

  void _leave() async {
    protocol.leave(await getUsername());
  }
}
