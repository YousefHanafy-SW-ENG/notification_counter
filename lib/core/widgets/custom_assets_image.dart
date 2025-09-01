import 'package:flutter/material.dart';

class CustomAssetsImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CustomAssetsImage({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      filterQuality: FilterQuality.none, // تعطيل mipmaps
    );
  }
}
