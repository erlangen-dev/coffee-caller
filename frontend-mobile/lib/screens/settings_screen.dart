import 'package:coffee_caller/widgets/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final TextEditingController _serverUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = context.read<SettingsCubit>().state.username;
    _serverUrlController.text = context.read<SettingsCubit>().state.serverUrl;
  }

  void _save() async {
    var newUsername = _usernameController.value.text.toString();
    var serverUrl = _serverUrlController.value.text.toString();
    var cubit = context.read<SettingsCubit>();
    await cubit.save(newUsername, serverUrl);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
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
            Hero(
              tag: 'coffee-cup',
              child: Image.asset(
                'assets/coffee_cup.png',
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _serverUrlController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Server URL',
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
              onPressed: _save,
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
