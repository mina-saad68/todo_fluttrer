import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFFDFECDB);
  static Color primaryDarkColor = Color(0xFF060E1E);
  static Color onPrimaryColor = Color(0xFF5D9CEC);
  static Color onPrimaryDarkColor = Color(0xFF5D9CEC);
  static Color secColor = Colors.white;
  static Color secDarkColor = Color(0xFF141922);
  static Color isDoneColor = Color(0xFF61E757);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: onPrimaryColor,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 28),
        selectedIconTheme: IconThemeData(color: onPrimaryColor, size: 30),
        showSelectedLabels: false,
        showUnselectedLabels: false
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        secondary: secColor,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: primaryColor,
        onBackground: Colors.white,
        surface: isDoneColor,
        onSurface: Colors.white)
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: onPrimaryDarkColor,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 28),
        selectedIconTheme: IconThemeData(color: onPrimaryDarkColor, size: 30),
        showSelectedLabels: false,
        showUnselectedLabels: false),

      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primaryDarkColor,
          onPrimary: onPrimaryDarkColor,
          secondary: secDarkColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: primaryDarkColor,
          onBackground: Colors.white,
          surface: isDoneColor,
          onSurface: Colors.white)

  );
}
