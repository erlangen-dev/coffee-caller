import 'package:shared_preferences/shared_preferences.dart';

const String usernameKey = 'name';
const String serverUrlkey = 'serverUrl';

Future<String> getUsername() => _getByKey(usernameKey);
Future<String> getServerUrl() => _getByKey(serverUrlkey);

Future<void> setUsername(String name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(usernameKey, name);
}

Future<void> setServerUrl(String url) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(usernameKey, url);
}

Future<String> _getByKey(String key) async {
  var prefs = await SharedPreferences.getInstance();
  var saved = prefs.get(key);
  if (saved == null) {
    return '';
  }
  return saved.toString();
}
