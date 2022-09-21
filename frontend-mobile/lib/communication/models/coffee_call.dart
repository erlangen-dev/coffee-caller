import 'package:coffee_caller/communication/models/coffee_caller_command.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_call.freezed.dart';
part 'coffee_call.g.dart';

enum CoffeeCallStatus { announced, started, cancelled, inactive }

@freezed
class CoffeeCall with _$CoffeeCall {
  factory CoffeeCall(
    CoffeeCallStatus status,
    List<String> participants,
    List<TimedCoffeeCallerCommand> messages,
  ) = _CoffeeCaller;

  factory CoffeeCall.fromJson(Map<String, dynamic> json) =>
      _$CoffeeCallFromJson(json);
}
