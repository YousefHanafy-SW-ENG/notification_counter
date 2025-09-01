import 'package:flutter/material.dart';
import 'package:notification_counter/core/theming/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.thickness, this.color});
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
        thickness: thickness ?? 2, color: color ?? AppColors.white1);
  }
}