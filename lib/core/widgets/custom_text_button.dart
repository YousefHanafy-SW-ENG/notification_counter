import 'package:flutter/material.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onTap,
    this.text,
    this.textColor,
    this.borderColor,
    this.fillColor,
    this.widget,
    this.isActive,
    this.height,
    this.width,
    this.gradient, // New parameter
  });

  final Function? onTap;
  final Widget? widget;
  final String? text;
  final Color? textColor;
  final Color? borderColor;
  final Color? fillColor;
  final bool? isActive;
  final double? height;
  final double? width;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive == false ? null : () => onTap?.call(),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: height ?? 48,
          width: width ?? double.infinity,
          padding: const EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            color: (gradient != null || isActive == false)
                ? null
                : fillColor ?? AppColors.primaryColor,
            gradient: isActive == false ? null : gradient,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive == false
                  ? AppColors.grey6
                  : borderColor ?? Colors.white,
            ),
          ),
          child: Center(
            child: text != null
                ? CustomText(
              text: text ?? '',
              color: isActive == false
                  ? AppColors.grey8
                  : textColor ?? AppColors.white6,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )
                : widget,
          ),
        ),
      ),
    );
  }
}
