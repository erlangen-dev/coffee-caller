import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

enum SettingsStatus { loading, invalid, loaded }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState([
    @Default(SettingsStatus.loading) SettingsStatus status,
    @Default('') String username,
    @Default('') String serverUrl,
  ]) = _SettingsState;
}
