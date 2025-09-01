import 'package:flutter/material.dart';
import 'package:notification_counter/core/theming/app_colors.dart';

class RadioButtonTheme {
  static RadioThemeData radioTheme = RadioThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.greenColor;
      }
      return Colors.grey;
    }),
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
  );
}
