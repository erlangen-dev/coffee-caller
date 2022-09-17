import 'package:coffee_caller/communication/socket_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_call_state.freezed.dart';

enum CoffeeCallStatus { unknown, initiated, started, canceled }

@freezed
class CoffeeCallState with _$CoffeeCallState {
  const factory CoffeeCallState([
    @Default(CoffeeCallStatus.unknown) CoffeeCallStatus status,
    @Default(SocketConnectStatus.unknown) SocketConnectStatus connectStatus,
    @Default([]) List<String> messages,
  ]) = _CoffeeCallState;
}
