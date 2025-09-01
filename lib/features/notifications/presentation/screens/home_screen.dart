import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/notification_notifier.dart';
import '../widgets/notification_badge.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(notificationProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Counter"),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => notifier.increment(),
              ),
              const Positioned(
                right: 8,
                top: 8,
                child: NotificationBadge(),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => notifier.loadNotifications(),
          child: const Text("Load Notifications"),
        ),
      ),
    );
  }
}
