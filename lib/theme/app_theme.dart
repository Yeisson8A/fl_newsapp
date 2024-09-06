import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(120, 0, 0, 1);
  static const Color secondary = Color.fromRGBO(13, 71, 161, 1);
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Color primario
    primaryColor: primary,
    // Tema del BottomNavigationBar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primary,
      backgroundColor: Colors.grey[900]
    )
  );
}