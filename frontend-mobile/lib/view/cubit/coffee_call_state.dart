import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_call_state.freezed.dart';

enum CoffeeCallStatus { initial, connected, disconnected }

@freezed
class CoffeeCallState with _$CoffeeCallState {
  const factory CoffeeCallState([
    @Default(CoffeeCallStatus.initial) CoffeeCallStatus status,
    @Default([]) List<String> messages,
  ]) = _CoffeeCallState;
}
