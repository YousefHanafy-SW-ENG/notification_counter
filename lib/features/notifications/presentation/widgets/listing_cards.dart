import 'package:flutter/material.dart';
import 'package:notification_counter/core/helpers/app_assets.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/app_horizontal_padding.dart';
import 'package:notification_counter/features/notifications/presentation/widgets/listing_tile.dart';

class ListingCards extends StatelessWidget {
  const ListingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppHorizontalPadding(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 26,
                  bottom: 26,
                  right: -10,
                  child: Container(
                    width: 10,
                    decoration: BoxDecoration(
                      color: AppColors.greyContainerColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      ListingTile(
                        name: 'John Wick',
                        rating: 4.7,
                        location: 'Zamalek',
                        distanceKm: 23,
                        matchPercent: 75,
                        avatarImage: AppAssets.images.profilePhoto,
                        productAssetName: AppAssets.images.productPhoto,
                        title: 'Xbox Series S 512 GB',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
