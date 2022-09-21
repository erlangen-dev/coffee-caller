// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoffeeCaller _$$_CoffeeCallerFromJson(Map<String, dynamic> json) =>
    _$_CoffeeCaller(
      $enumDecode(_$CoffeeCallStatusEnumMap, json['status']),
      (json['participants'] as List<dynamic>).map((e) => e as String).toList(),
      (json['messages'] as List<dynamic>)
          .map((e) =>
              TimedCoffeeCallerCommand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CoffeeCallerToJson(_$_CoffeeCaller instance) =>
    <String, dynamic>{
      'status': _$CoffeeCallStatusEnumMap[instance.status]!,
      'participants': instance.participants,
      'messages': instance.messages,
    };

const _$CoffeeCallStatusEnumMap = {
  CoffeeCallStatus.announced: 'announced',
  CoffeeCallStatus.started: 'started',
  CoffeeCallStatus.cancelled: 'cancelled',
  CoffeeCallStatus.inactive: 'inactive',
};
