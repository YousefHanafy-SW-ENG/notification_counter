import 'package:flutter/material.dart';
import 'package:notification_counter/core/theming/check_box_theme.dart';
import 'package:notification_counter/core/theming/radio_button_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: false,
    checkboxTheme: CheckBoxTheme.checkBoxTheme,
    radioTheme: RadioButtonTheme.radioTheme,
  );
}
