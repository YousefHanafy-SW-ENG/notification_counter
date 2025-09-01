import 'package:flutter/material.dart';
import 'package:notification_counter/core/helpers/app_strings.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/theming/check_box_theme.dart';
import 'package:notification_counter/core/theming/radio_button_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: AppStrings.montserratFont,
    scaffoldBackgroundColor: AppColors.whiteBackground,
    useMaterial3: false,
    checkboxTheme: CheckBoxTheme.checkBoxTheme,
    radioTheme: RadioButtonTheme.radioTheme,
  );
}
