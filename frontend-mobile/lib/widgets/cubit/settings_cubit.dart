import 'package:bloc/bloc.dart';
import 'package:coffee_caller/widgets/cubit/settings_state.dart';
import 'package:coffee_caller/storage/settings_storage.dart' as storage;

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void init() async {
    var username = await storage.getUsername();
    var serverUrl = await storage.getServerUrl();
    emit(state.copyWith(
        status: SettingsStatus.loaded,
        username: username,
        serverUrl: serverUrl));
  }

  Future<void> save(String username, String serverUrl) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    await storage.setUsername(username);
    await storage.setUsername(serverUrl);
    emit(state.copyWith(
        username: username,
        serverUrl: serverUrl,
        status: getNextState(username, serverUrl)));
  }

  SettingsStatus getNextState(String username, String serverUrl) {
    if (username != '' && serverUrl != '') {
      return SettingsStatus.loaded;
    }
    return SettingsStatus.invalid;
  }
}
