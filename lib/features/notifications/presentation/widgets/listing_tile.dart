import 'package:flutter/material.dart';
import 'package:notification_counter/core/helpers/spacer.dart';
import 'package:notification_counter/core/widgets/custom_assets_image.dart';
import 'package:notification_counter/core/widgets/custom_text.dart';
import 'package:notification_counter/features/notifications/presentation/widgets/profile_title_row.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({
    super.key,
    required this.name,
    required this.rating,
    required this.location,
    required this.distanceKm,
    required this.matchPercent,
    required this.avatarImage,
    required this.productAssetName,
    required this.title,
    this.imageAspectRatio = 0.75,
    this.imageBorderRadius = 14,
    this.addBottomSpace = true,
  });

  final String name;
  final double rating;
  final String location;
  final num distanceKm;
  final int matchPercent;
  final String avatarImage;

  final String productAssetName;
  final String title;

  final double imageAspectRatio;
  final double imageBorderRadius;
  final bool addBottomSpace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileRowTile(
          name: name,
          rating: rating,
          location: location,
          distanceKm: distanceKm,
          matchPercent: matchPercent,
          avatarImage: avatarImage,
        ),
        const VerticalSpace(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(imageBorderRadius),
          child: AspectRatio(
            aspectRatio: imageAspectRatio,
            child: CustomAssetsImage(
              assetName: productAssetName,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const VerticalSpace(height: 13),
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 12.0),
          child: SizedBox(), // keeps padding structure for const; replaced below
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12.0),
          child: CustomText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
