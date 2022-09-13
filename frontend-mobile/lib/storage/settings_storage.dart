import 'package:shared_preferences/shared_preferences.dart';

const String usernameKey = 'name';

Future<String> getUsername() async {
  var prefs = await SharedPreferences.getInstance();
  var savedUsername = prefs.get(usernameKey);
  if (savedUsername == null) {
    return '';
  }
  return savedUsername.toString();
}

Future<void> setUsername(String name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(usernameKey, name);
}
