import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class NoUsername extends StatelessWidget {
  final VoidCallback onUsernameSet;

  const NoUsername({super.key, required this.onUsernameSet});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please set a username to participate in calls!',
              style: TextStyle(fontSize: 32)),
          TextButton(
            onPressed: () async {
              await navigateToSettings(context);
              onUsernameSet();
            },
            child: const Text(
              'Settings',
              style: TextStyle(fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}
