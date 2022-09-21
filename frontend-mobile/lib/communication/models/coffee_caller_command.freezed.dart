// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coffee_caller_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoffeeCallerCommand _$CoffeeCallerCommandFromJson(Map<String, dynamic> json) {
  return _CoffeeCallerCommand.fromJson(json);
}

/// @nodoc
mixin _$CoffeeCallerCommand {
  CoffeeCallerCommandType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeCallerCommandCopyWith<CoffeeCallerCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCallerCommandCopyWith<$Res> {
  factory $CoffeeCallerCommandCopyWith(
          CoffeeCallerCommand value, $Res Function(CoffeeCallerCommand) then) =
      _$CoffeeCallerCommandCopyWithImpl<$Res>;
  $Res call({CoffeeCallerCommandType type, String name});
}

/// @nodoc
class _$CoffeeCallerCommandCopyWithImpl<$Res>
    implements $CoffeeCallerCommandCopyWith<$Res> {
  _$CoffeeCallerCommandCopyWithImpl(this._value, this._then);

  final CoffeeCallerCommand _value;
  // ignore: unused_field
  final $Res Function(CoffeeCallerCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoffeeCallerCommandType,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CoffeeCallerCommandCopyWith<$Res>
    implements $CoffeeCallerCommandCopyWith<$Res> {
  factory _$$_CoffeeCallerCommandCopyWith(_$_CoffeeCallerCommand value,
          $Res Function(_$_CoffeeCallerCommand) then) =
      __$$_CoffeeCallerCommandCopyWithImpl<$Res>;
  @override
  $Res call({CoffeeCallerCommandType type, String name});
}

/// @nodoc
class __$$_CoffeeCallerCommandCopyWithImpl<$Res>
    extends _$CoffeeCallerCommandCopyWithImpl<$Res>
    implements _$$_CoffeeCallerCommandCopyWith<$Res> {
  __$$_CoffeeCallerCommandCopyWithImpl(_$_CoffeeCallerCommand _value,
      $Res Function(_$_CoffeeCallerCommand) _then)
      : super(_value, (v) => _then(v as _$_CoffeeCallerCommand));

  @override
  _$_CoffeeCallerCommand get _value => super._value as _$_CoffeeCallerCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_CoffeeCallerCommand(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoffeeCallerCommandType,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoffeeCallerCommand implements _CoffeeCallerCommand {
  _$_CoffeeCallerCommand(this.type, this.name);

  factory _$_CoffeeCallerCommand.fromJson(Map<String, dynamic> json) =>
      _$$_CoffeeCallerCommandFromJson(json);

  @override
  final CoffeeCallerCommandType type;
  @override
  final String name;

  @override
  String toString() {
    return 'CoffeeCallerCommand(type: $type, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeCallerCommand &&
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
  _$$_CoffeeCallerCommandCopyWith<_$_CoffeeCallerCommand> get copyWith =>
      __$$_CoffeeCallerCommandCopyWithImpl<_$_CoffeeCallerCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoffeeCallerCommandToJson(
      this,
    );
  }
}

abstract class _CoffeeCallerCommand implements CoffeeCallerCommand {
  factory _CoffeeCallerCommand(
          final CoffeeCallerCommandType type, final String name) =
      _$_CoffeeCallerCommand;

  factory _CoffeeCallerCommand.fromJson(Map<String, dynamic> json) =
      _$_CoffeeCallerCommand.fromJson;

  @override
  CoffeeCallerCommandType get type;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeCallerCommandCopyWith<_$_CoffeeCallerCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

TimedCoffeeCallerCommand _$TimedCoffeeCallerCommandFromJson(
    Map<String, dynamic> json) {
  return _TimedCoffeeCallerCommand.fromJson(json);
}

/// @nodoc
mixin _$TimedCoffeeCallerCommand {
  CoffeeCallerCommandType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get broadcastAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimedCoffeeCallerCommandCopyWith<TimedCoffeeCallerCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimedCoffeeCallerCommandCopyWith<$Res> {
  factory $TimedCoffeeCallerCommandCopyWith(TimedCoffeeCallerCommand value,
          $Res Function(TimedCoffeeCallerCommand) then) =
      _$TimedCoffeeCallerCommandCopyWithImpl<$Res>;
  $Res call({CoffeeCallerCommandType type, String name, DateTime broadcastAt});
}

/// @nodoc
class _$TimedCoffeeCallerCommandCopyWithImpl<$Res>
    implements $TimedCoffeeCallerCommandCopyWith<$Res> {
  _$TimedCoffeeCallerCommandCopyWithImpl(this._value, this._then);

  final TimedCoffeeCallerCommand _value;
  // ignore: unused_field
  final $Res Function(TimedCoffeeCallerCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
    Object? broadcastAt = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoffeeCallerCommandType,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      broadcastAt: broadcastAt == freezed
          ? _value.broadcastAt
          : broadcastAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_TimedCoffeeCallerCommandCopyWith<$Res>
    implements $TimedCoffeeCallerCommandCopyWith<$Res> {
  factory _$$_TimedCoffeeCallerCommandCopyWith(
          _$_TimedCoffeeCallerCommand value,
          $Res Function(_$_TimedCoffeeCallerCommand) then) =
      __$$_TimedCoffeeCallerCommandCopyWithImpl<$Res>;
  @override
  $Res call({CoffeeCallerCommandType type, String name, DateTime broadcastAt});
}

/// @nodoc
class __$$_TimedCoffeeCallerCommandCopyWithImpl<$Res>
    extends _$TimedCoffeeCallerCommandCopyWithImpl<$Res>
    implements _$$_TimedCoffeeCallerCommandCopyWith<$Res> {
  __$$_TimedCoffeeCallerCommandCopyWithImpl(_$_TimedCoffeeCallerCommand _value,
      $Res Function(_$_TimedCoffeeCallerCommand) _then)
      : super(_value, (v) => _then(v as _$_TimedCoffeeCallerCommand));

  @override
  _$_TimedCoffeeCallerCommand get _value =>
      super._value as _$_TimedCoffeeCallerCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
    Object? broadcastAt = freezed,
  }) {
    return _then(_$_TimedCoffeeCallerCommand(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoffeeCallerCommandType,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      broadcastAt == freezed
          ? _value.broadcastAt
          : broadcastAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimedCoffeeCallerCommand implements _TimedCoffeeCallerCommand {
  _$_TimedCoffeeCallerCommand(this.type, this.name, this.broadcastAt);

  factory _$_TimedCoffeeCallerCommand.fromJson(Map<String, dynamic> json) =>
      _$$_TimedCoffeeCallerCommandFromJson(json);

  @override
  final CoffeeCallerCommandType type;
  @override
  final String name;
  @override
  final DateTime broadcastAt;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimedCoffeeCallerCommand &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.broadcastAt, broadcastAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(broadcastAt));

  @JsonKey(ignore: true)
  @override
  _$$_TimedCoffeeCallerCommandCopyWith<_$_TimedCoffeeCallerCommand>
      get copyWith => __$$_TimedCoffeeCallerCommandCopyWithImpl<
          _$_TimedCoffeeCallerCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimedCoffeeCallerCommandToJson(
      this,
    );
  }
}

abstract class _TimedCoffeeCallerCommand implements TimedCoffeeCallerCommand {
  factory _TimedCoffeeCallerCommand(
      final CoffeeCallerCommandType type,
      final String name,
      final DateTime broadcastAt) = _$_TimedCoffeeCallerCommand;

  factory _TimedCoffeeCallerCommand.fromJson(Map<String, dynamic> json) =
      _$_TimedCoffeeCallerCommand.fromJson;

  @override
  CoffeeCallerCommandType get type;
  @override
  String get name;
  @override
  DateTime get broadcastAt;
  @override
  @JsonKey(ignore: true)
  _$$_TimedCoffeeCallerCommandCopyWith<_$_TimedCoffeeCallerCommand>
      get copyWith => throw _privateConstructorUsedError;
}
