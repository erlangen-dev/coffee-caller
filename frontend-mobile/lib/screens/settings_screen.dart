import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:flutter/material.dart';

Future<void> navigateToSettings(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUsername().then((value) => _usernameController.text = value);
  }

  void _save() {
    var username = _usernameController.value.text.toString();
    setUsername(username).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(4, 12, 4, 4),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            TextButton(onPressed: _save, child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
