import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class NoUsername extends StatelessWidget {

  const NoUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Please set a username to participate in calls!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),
          ),
          TextButton(
            onPressed: () async {
              await navigateToSettings(context);
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
