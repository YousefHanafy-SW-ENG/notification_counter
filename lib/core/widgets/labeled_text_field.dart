import 'package:flutter/material.dart';
import 'package:notification_counter/core/helpers/spacer.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/custom_text.dart';

class LabeledTextField extends StatelessWidget {
  final String text;
  final Widget textField;
  const LabeledTextField(
      {super.key, required this.text, required this.textField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.blackShade,
        ),
        const VerticalSpace(height: 16),
        textField,
      ],
    );
  }
}
