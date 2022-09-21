// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_caller_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoffeeCallerCommand _$$_CoffeeCallerCommandFromJson(
        Map<String, dynamic> json) =>
    _$_CoffeeCallerCommand(
      $enumDecode(_$CoffeeCallerCommandTypeEnumMap, json['type']),
      json['name'] as String,
    );

Map<String, dynamic> _$$_CoffeeCallerCommandToJson(
        _$_CoffeeCallerCommand instance) =>
    <String, dynamic>{
      'type': _$CoffeeCallerCommandTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

const _$CoffeeCallerCommandTypeEnumMap = {
  CoffeeCallerCommandType.join: 'join',
  CoffeeCallerCommandType.start: 'start',
  CoffeeCallerCommandType.leave: 'leave',
};

_$_TimedCoffeeCallerCommand _$$_TimedCoffeeCallerCommandFromJson(
        Map<String, dynamic> json) =>
    _$_TimedCoffeeCallerCommand(
      $enumDecode(_$CoffeeCallerCommandTypeEnumMap, json['type']),
      json['name'] as String,
      DateTime.parse(json['broadcastAt'] as String),
    );

Map<String, dynamic> _$$_TimedCoffeeCallerCommandToJson(
        _$_TimedCoffeeCallerCommand instance) =>
    <String, dynamic>{
      'type': _$CoffeeCallerCommandTypeEnumMap[instance.type]!,
      'name': instance.name,
      'broadcastAt': instance.broadcastAt.toIso8601String(),
    };
