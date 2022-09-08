import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_caller_message.freezed.dart';
part 'coffee_caller_message.g.dart';

enum CoffeeCallerMessageType { join, start, leave }

@freezed
class CoffeeCallerMessage with _$CoffeeCallerMessage {
  factory CoffeeCallerMessage(
    CoffeeCallerMessageType type,
    String name,
  ) = _CoffeeCallerMessage;

  factory CoffeeCallerMessage.fromJson(Map<String, dynamic> json) =>
      _$CoffeeCallerMessageFromJson(json);
}