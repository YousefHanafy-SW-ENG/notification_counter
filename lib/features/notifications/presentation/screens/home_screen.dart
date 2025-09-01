import 'package:flutter/material.dart';
import 'package:notification_counter/core/widgets/custom_app_bar.dart';
import 'package:notification_counter/features/notifications/presentation/widgets/listing_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          CustomHomeAppBar(),
          ListingCards(),
        ],
      ),
    );
  }
}
