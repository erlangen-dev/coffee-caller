import 'package:flutter/material.dart';

class CoffeeCupLogo extends StatelessWidget {
  final VoidCallback onClick;

  const CoffeeCupLogo({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Hero(
        tag: 'coffee-cup',
        child: Material(
          child: ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(48),
            ),
            child: Image.asset(
              'assets/coffee_cup.png',
              height: 200,
              width: 200,
              alignment: const Alignment(100, 20),
            ),
          ),
        ),
      ),
    );
  }
}
