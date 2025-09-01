import 'package:flutter/material.dart';

class AppHorizontalPadding extends StatelessWidget {
  final Widget child;

  const AppHorizontalPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}
