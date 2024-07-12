import 'package:flutter/material.dart';

class AppThemes {
  ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade700,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          )),
      colorScheme: ColorScheme.light(
        primary: Colors.blue.shade700,
        secondary: Colors.red.shade700,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        enableFeedback: false,
        backgroundColor: Colors.grey.shade700,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade700,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )),
      colorScheme: ColorScheme.dark(
        primary: Colors.blue.shade900,
        secondary: Colors.red.shade900,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        enableFeedback: false,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
      ),
    );
  }
}
