import 'package:flutter/material.dart';

const Color nightfall = Color(0xff404553);
const Color nightSky = Color(0xff24272d);

const TextStyle textStyle = TextStyle(
  color: Colors.white,
);

ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme.dark(primary: Colors.greenAccent),
  appBarTheme: const AppBarTheme(
    color: nightfall,
  ),
);
