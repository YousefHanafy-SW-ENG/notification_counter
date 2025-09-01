import 'package:flutter/material.dart';
import 'package:notification_counter/core/theming/app_colors.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider(
      {super.key,
      this.color,
      this.height,
      this.width,
      this.startPadding,
      this.endPadding});

  final Color? color;
  final double? height;
  final double? width;
  final double? startPadding;
  final double? endPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: startPadding ?? 14, end: endPadding ?? 14),
      child: SizedBox(
        height: height ?? 18,
        child: VerticalDivider(
          thickness: 1,
          width: width ?? 10,
          color: color ?? AppColors.grey7,
        ),
      ),
    );
  }
}
