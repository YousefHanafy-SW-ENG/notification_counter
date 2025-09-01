import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:notification_counter/core/helpers/app_assets.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/custom_assets_image.dart';
import 'package:notification_counter/core/widgets/custom_svg_icon.dart';
import 'package:notification_counter/core/widgets/custom_text.dart';

class ProfileRowTile extends StatelessWidget {
  const ProfileRowTile({
    super.key,
    required this.name,
    required this.rating,
    required this.location,
    required this.distanceKm,
    required this.matchPercent,
    required this.avatarImage,
    this.avatarSize = 40,
    this.onTap,
  });

  final String name;
  final double rating;
  final String location;
  final num distanceKm;
  final int matchPercent;
  final String avatarImage;
  final double avatarSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ArcAvatar(
            image: avatarImage,
            size: avatarSize,
            percent: matchPercent / 100.0,
            badgeText: '$matchPercent%',
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  maxLines: 1,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                const SizedBox(height: 4),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 2,
                  children: [
                    CustomSvgIcon(assetName: AppAssets.icons.ratingIcon),
                    CustomText(
                      text: rating.toStringAsFixed(1),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    CustomText(
                        text: '·',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      color: AppColors.greyTextColor,
                    ),
                    CustomText(
                      text: '$location (${_formatKm(distanceKm)} km from you)',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.greyTextColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatKm(num km) {
    return km % 1 == 0 ? km.toInt().toString() : km.toStringAsFixed(1);
  }
}

class _ArcAvatar extends StatelessWidget {
  const _ArcAvatar({
    required this.image,
    required this.size,
    required this.percent,
    required this.badgeText,
  });

  final String image;
  final double size;
  final double percent;
  final String badgeText;

  @override
  Widget build(BuildContext context) {
    const ringColor = AppColors.greenColor;
    const ringWidth = 2.0;
    const gapDegrees = 14.0;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _RingPainter(
                progress: percent.clamp(0, 1),
                color: ringColor,
                strokeWidth: ringWidth,
                gapDegrees: gapDegrees,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(ringWidth + 1),
              child: ClipOval(
                child: CustomAssetsImage(
                  assetName: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // 75% badge
          Positioned(
            left: 8,
            bottom: -4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: ringColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: CustomText(
                  text:  badgeText,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
    this.gapDegrees = 0,
  });

  final double progress;
  final Color color;
  final double strokeWidth;
  final double gapDegrees;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (math.min(size.width, size.height) / 2) - (strokeWidth / 2);

    final bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color.withOpacity(0.15)
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bgPaint);
    final gapRadians = gapDegrees * math.pi / 180;
    final start = -math.pi / 2 + gapRadians / 2;
    final sweep = (progress * 2 * math.pi - gapRadians).clamp(0.0, 2 * math.pi);
    if (sweep <= 0) return;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = color;

    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, start, sweep, false, paint);
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        gapDegrees != oldDelegate.gapDegrees;
  }
}
