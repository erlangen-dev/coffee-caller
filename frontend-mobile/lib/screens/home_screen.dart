import 'package:coffee_caller/screens/settings_screen.dart';
import 'package:coffee_caller/widgets/coffee_call.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Coffee Caller'),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () => navigateToSettings(context),
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
            ),
          ],
        ),
        body: const CoffeeCall());
  }
}
