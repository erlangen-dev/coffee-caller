import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_caller_command.freezed.dart';
part 'coffee_caller_command.g.dart';

enum CoffeeCallerCommandType { join, start, leave }

@freezed
class CoffeeCallerCommand with _$CoffeeCallerCommand {
  factory CoffeeCallerCommand(
    CoffeeCallerCommandType type,
    String name,
  ) = _CoffeeCallerCommand;

  factory CoffeeCallerCommand.fromJson(Map<String, dynamic> json) =>
      _$CoffeeCallerCommandFromJson(json);
}

@freezed
class TimedCoffeeCallerCommand with _$TimedCoffeeCallerCommand {
  factory TimedCoffeeCallerCommand(
    CoffeeCallerCommandType type,
    String name,
    DateTime broadcastAt,
  ) = _TimedCoffeeCallerCommand;

  factory TimedCoffeeCallerCommand.fromJson(Map<String, dynamic> json) =>
      _$TimedCoffeeCallerCommandFromJson(json);
}
