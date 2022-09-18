import 'package:bloc/bloc.dart';
import 'package:coffee_caller/communication/coffee_caller_protocol.dart';
import 'package:coffee_caller/communication/models/coffee_caller_message.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:coffee_caller/widgets/cubit/coffee_call_state.dart';

class CoffeeCallCubit extends Cubit<CoffeeCallState> {
  CoffeeCallerProtocol protocol;

  CoffeeCallCubit({
    required this.protocol,
  }) : super(const CoffeeCallState());

  void init() {
    protocol.messages.listen((message) {
      final localDate = message.broadcastAt.toLocal();
      final hour = localDate.hour.toString().padLeft(2, '0');
      final minute = localDate.minute.toString().padLeft(2, '0');
      final second = localDate.second.toString().padLeft(2, '0');
      final time = '$hour:$minute:$second';

      var newStatus = _getNextStatusByMessageType(message.type);

      emit(state.copyWith(status: newStatus, messages: [
        ...state.messages,
        '${message.name} ${message.type.name}s a coffee call @$time',
      ]));
    });

    protocol
        .connect()
        .listen((status) => emit(state.copyWith(connectStatus: status)));
  }

  void next() {
    if (state.status == CoffeeCallStatus.unknown) {
      _join();
      return;
    }
    if (state.status == CoffeeCallStatus.initiated) {
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

  CoffeeCallStatus _getNextStatusByMessageType(
      CoffeeCallerMessageType messageType) {
    if (messageType == CoffeeCallerMessageType.join) {
      return CoffeeCallStatus.initiated;
    }
    if (messageType == CoffeeCallerMessageType.start) {
      return CoffeeCallStatus.started;
    }
    return CoffeeCallStatus.unknown;
  }
}
