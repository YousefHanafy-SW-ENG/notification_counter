import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final String? semanticsLabel;
  final Color? color;
  final BoxFit fit;

  const CustomSvgIcon({
    required this.assetName,
    this.width,
    this.height,
    this.semanticsLabel,
    this.color,
    this.fit = BoxFit.none,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      fit: fit,
      assetName,
      width: width,
      height: height,
      semanticsLabel: semanticsLabel,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null, // No ColorFilter if color is null
    );
  }
}
