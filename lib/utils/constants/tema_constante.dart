import 'package:flutter/material.dart';

final ThemeData temaClaro = ThemeData(
  primarySwatch: Colors.red,
);

//!================= ESCURO ========================
final ThemeData temaEscuro = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.red),
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);
