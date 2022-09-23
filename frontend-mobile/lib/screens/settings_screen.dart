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

  @override
  void initState() {
    super.initState();
    _usernameController.text = context.read<SettingsCubit>().state.username;
  }

  void _save() async {
    var newUsername = _usernameController.value.text.toString();
    await context.read<SettingsCubit>().setUsername(newUsername);
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: _save,
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
