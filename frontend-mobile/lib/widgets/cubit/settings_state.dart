import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

enum SettingsStatus {initial, loaded}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState([
    @Default(SettingsStatus.initial) SettingsStatus status,
    @Default("") String username,
  ]) = _SettingsState;
}
