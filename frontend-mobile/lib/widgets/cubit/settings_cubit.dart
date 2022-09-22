import 'package:bloc/bloc.dart';
import 'package:coffee_caller/widgets/cubit/settings_state.dart';
import 'package:coffee_caller/storage/settings_storage.dart' as storage;

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void init() async {
    var username = await storage.getUsername();
    emit(state.copyWith(status: SettingsStatus.loaded, username: username));
  }

  Future<void> setUsername(String newUsername) async {
    await storage.setUsername(newUsername);
    emit(state.copyWith(username: newUsername));
  }
}
