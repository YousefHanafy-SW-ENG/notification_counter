import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_counter/core/widgets/bottom_nav_bar.dart';
import 'package:notification_counter/features/notifications/presentation/screens/home_screen.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    final pages = [
      const HomeScreen(),     // index 0
      const HomeScreen(),     // index 0
      const HomeScreen(),     // index 0
      const HomeScreen(),     // index 0
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: PillBottomNav(
        currentIndex: currentIndex,
        onTap: (i) => ref.read(bottomNavIndexProvider.notifier).state = i,
      ),
    );
  }
}
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
