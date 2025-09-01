import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.value, required this.onChanged});

  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.75,
          child: Checkbox.adaptive(

            value: value,
            onChanged: (val) {
              onChanged(val);
            },
          ),
        ),
      ],
    );
  }
}
