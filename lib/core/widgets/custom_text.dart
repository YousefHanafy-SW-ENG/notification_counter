import 'package:flutter/material.dart';
import 'package:notification_counter/core/helpers/app_strings.dart';
import 'package:notification_counter/core/theming/app_colors.dart';

class CustomText extends StatelessWidget {
  final bool hasFontSize;
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final Color? decorationColor;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? height;
  final double? wordSpacing;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextStyle? style;
  final Gradient? gradient;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = AppStrings.montserratFont,
    this.color = AppColors.black,
    this.decorationColor = AppColors.black,
    this.textAlign = TextAlign.right,
    this.letterSpacing,
    this.height,
    this.decoration,
    this.maxLines = 1,
    this.fontStyle,
    this.wordSpacing = 0.0,
    this.hasFontSize = true,
    this.style,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      strutStyle: hasFontSize
          ? StrutStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              height: height ?? 1.0,
              forceStrutHeight: true,
            )
          : StrutStyle(
              height: height ?? 1.0,
              forceStrutHeight: true,
              fontFamily: fontFamily,
            ),
      style: style ??
          (hasFontSize
              ? TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: gradient == null ? color : null,
                  fontStyle: fontStyle,
                  letterSpacing: letterSpacing,
                  height: height,
                  decoration: decoration,
                  decorationColor: decorationColor,
                  wordSpacing: wordSpacing,
                  overflow: TextOverflow.ellipsis,
                  foreground: gradient != null
                      ? (Paint()
                        ..shader = gradient!.createShader(
                          Rect.fromLTWH(0, 0, text.length * fontSize, fontSize),
                        ))
                      : null,
                )
              : TextStyle(
                  fontFamily: fontFamily,
                  fontWeight: fontWeight,
                  color: gradient == null ? color : null,
                  fontStyle: fontStyle,
                  letterSpacing: letterSpacing,
                  height: height,
                  decoration: decoration,
                  overflow: TextOverflow.ellipsis,
                  foreground: gradient != null
                      ? (Paint()
                        ..shader = gradient!.createShader(
                          Rect.fromLTWH(0, 0, text.length * fontSize, fontSize),
                        ))
                      : null,
                )),
    );
  }
}
