// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_caller_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoffeeCallerMessage _$$_CoffeeCallerMessageFromJson(
        Map<String, dynamic> json) =>
    _$_CoffeeCallerMessage(
      $enumDecode(_$CoffeeCallerMessageTypeEnumMap, json['type']),
      json['name'] as String,
    );

Map<String, dynamic> _$$_CoffeeCallerMessageToJson(
        _$_CoffeeCallerMessage instance) =>
    <String, dynamic>{
      'type': _$CoffeeCallerMessageTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

const _$CoffeeCallerMessageTypeEnumMap = {
  CoffeeCallerMessageType.join: 'join',
  CoffeeCallerMessageType.start: 'start',
  CoffeeCallerMessageType.leave: 'leave',
};
