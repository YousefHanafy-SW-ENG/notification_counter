import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {super.key,
      required this.image,
      required this.circleRaduis,
      this.elevation});
  final String image;
  final double circleRaduis;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      shape: const CircleBorder(),
      child: CircleAvatar(
        radius: circleRaduis,
        backgroundImage: NetworkImage(image),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
