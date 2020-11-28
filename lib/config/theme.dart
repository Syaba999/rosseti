import 'package:flutter/material.dart';

abstract class AppTheme {
  static Color _primaryColor = Color.fromRGBO(75, 97, 143, 1);
  static Color _accentColor = Color.fromRGBO(75, 97, 143, 1);

  static ThemeData themeData = ThemeData(
    primaryColor: _primaryColor,
    primaryColorDark: _primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonColor: _primaryColor,
    toggleableActiveColor: _primaryColor,
    accentColor: _accentColor,
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: _primaryColor),
  );
}
