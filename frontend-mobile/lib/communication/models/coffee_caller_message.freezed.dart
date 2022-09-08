// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coffee_caller_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoffeeCallerMessage _$CoffeeCallerMessageFromJson(Map<String, dynamic> json) {
  return _CoffeeCallerMessage.fromJson(json);
}

/// @nodoc
mixin _$CoffeeCallerMessage {
  CoffeeCallerMessageType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeCallerMessageCopyWith<CoffeeCallerMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCallerMessageCopyWith<$Res> {
  factory $CoffeeCallerMessageCopyWith(
          CoffeeCallerMessage value, $Res Function(CoffeeCallerMessage) then) =
      _$CoffeeCallerMessageCopyWithImpl<$Res>;
  $Res call({CoffeeCallerMessageType type, String name});
}

/// @nodoc
class _$CoffeeCallerMessageCopyWithImpl<$Res>
    implements $CoffeeCallerMessageCopyWith<$Res> {
  _$CoffeeCallerMessageCopyWithImpl(this._value, this._then);

  final CoffeeCallerMessage _value;
  // ignore: unused_field
  final $Res Function(CoffeeCallerMessage) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoffeeCallerMessageType,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CoffeeCallerMessageCopyWith<$Res>
    implements $CoffeeCallerMessageCopyWith<$Res> {
  factory _$$_CoffeeCallerMessageCopyWith(_$_CoffeeCallerMessage value,
          $Res Function(_$_CoffeeCallerMessage) then) =
      __$$_CoffeeCallerMessageCopyWithImpl<$Res>;
  @override
  $Res call({CoffeeCallerMessageType type, String name});
}

/// @nodoc
class __$$_CoffeeCallerMessageCopyWithImpl<$Res>
    extends _$CoffeeCallerMessageCopyWithImpl<$Res>
    implements _$$_CoffeeCallerMessageCopyWith<$Res> {
  __$$_CoffeeCallerMessageCopyWithImpl(_$_CoffeeCallerMessage _value,
      $Res Function(_$_CoffeeCallerMessage) _then)
      : super(_value, (v) => _then(v as _$_CoffeeCallerMessage));

  @override
  _$_CoffeeCallerMessage get _value => super._value as _$_CoffeeCallerMessage;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_CoffeeCallerMessage(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoffeeCallerMessageType,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoffeeCallerMessage implements _CoffeeCallerMessage {
  _$_CoffeeCallerMessage(this.type, this.name);

  factory _$_CoffeeCallerMessage.fromJson(Map<String, dynamic> json) =>
      _$$_CoffeeCallerMessageFromJson(json);

  @override
  final CoffeeCallerMessageType type;
  @override
  final String name;

  @override
  String toString() {
    return 'CoffeeCallerMessage(type: $type, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeCallerMessage &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_CoffeeCallerMessageCopyWith<_$_CoffeeCallerMessage> get copyWith =>
      __$$_CoffeeCallerMessageCopyWithImpl<_$_CoffeeCallerMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoffeeCallerMessageToJson(
      this,
    );
  }
}

abstract class _CoffeeCallerMessage implements CoffeeCallerMessage {
  factory _CoffeeCallerMessage(
          final CoffeeCallerMessageType type, final String name) =
      _$_CoffeeCallerMessage;

  factory _CoffeeCallerMessage.fromJson(Map<String, dynamic> json) =
      _$_CoffeeCallerMessage.fromJson;

  @override
  CoffeeCallerMessageType get type;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeCallerMessageCopyWith<_$_CoffeeCallerMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
