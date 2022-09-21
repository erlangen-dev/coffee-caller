import 'package:coffee_caller/communication/models/coffee_caller_command.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_call.freezed.dart';
part 'coffee_call.g.dart';

enum CoffeeCallStatus { announced, inProgress, cancelled, inactive }

@freezed
class CoffeeCall with _$CoffeeCall {
  const factory CoffeeCall(
    CoffeeCallStatus status,
    List<String> participants,
    List<TimedCoffeeCallerCommand> messages,
  ) = _CoffeeCall;

  factory CoffeeCall.fromJson(Map<String, dynamic> json) =>
      _$CoffeeCallFromJson(json);
}
