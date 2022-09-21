// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoffeeCall _$$_CoffeeCallFromJson(Map<String, dynamic> json) =>
    _$_CoffeeCall(
      $enumDecode(_$CoffeeCallStatusEnumMap, json['status']),
      (json['participants'] as List<dynamic>).map((e) => e as String).toList(),
      (json['messages'] as List<dynamic>)
          .map((e) =>
              TimedCoffeeCallerCommand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CoffeeCallToJson(_$_CoffeeCall instance) =>
    <String, dynamic>{
      'status': _$CoffeeCallStatusEnumMap[instance.status]!,
      'participants': instance.participants,
      'messages': instance.messages,
    };

const _$CoffeeCallStatusEnumMap = {
  CoffeeCallStatus.announced: 'announced',
  CoffeeCallStatus.inProgress: 'inProgress',
  CoffeeCallStatus.cancelled: 'cancelled',
  CoffeeCallStatus.inactive: 'inactive',
};
