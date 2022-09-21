import 'package:coffee_caller/communication/models/coffee_call.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_call_state.freezed.dart';

@freezed
class CoffeeCallState with _$CoffeeCallState {
  const factory CoffeeCallState([
    @Default(SocketConnectStatus.unknown) SocketConnectStatus connectStatus,
    @Default(CoffeeCall(CoffeeCallStatus.inactive, [], []))
        CoffeeCall coffeeCall,
  ]) = _CoffeeCallState;
}
