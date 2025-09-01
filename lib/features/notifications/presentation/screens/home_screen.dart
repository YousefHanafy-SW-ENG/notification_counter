import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_counter/core/helpers/app_assets.dart';
import 'package:notification_counter/core/widgets/app_horizontal_padding.dart';
import 'package:notification_counter/core/widgets/custom_app_bar.dart';
import 'package:notification_counter/features/notifications/presentation/widgets/listing_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body:Column(
        children: [
          CustomHomeAppBar(),
          AppHorizontalPadding(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListingTile(
                    name: 'John Wick',
                    rating: 4.7,
                    location: 'Zamalek',
                    distanceKm: 23,
                    matchPercent: 75,
                    avatarImage: AppAssets.images.profilePhoto,
                    productAssetName: AppAssets.images.productPhoto,
                    title: 'Xbox Series S 512 GB',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
