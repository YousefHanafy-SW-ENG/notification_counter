import 'package:flutter/material.dart';
import 'package:notification_counter/core/theming/app_colors.dart';

class CheckBoxTheme {
  static CheckboxThemeData checkBoxTheme = CheckboxThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return Colors.white;
    }),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
       ),
      side: const BorderSide(color: Colors.grey,width: 1),
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
  );
}
