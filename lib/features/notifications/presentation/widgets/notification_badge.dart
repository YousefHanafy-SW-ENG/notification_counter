import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/notification_notifier.dart';

class NotificationBadge extends ConsumerStatefulWidget {
  const NotificationBadge({super.key});

  @override
  ConsumerState<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends ConsumerState<NotificationBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.8,
      upperBound: 1.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationProvider);
    ref.listen(notificationProvider, (prev, next) {
      if (prev?.count != next.count) {
        _controller.forward(from: 0.8);
      }
    });

    if (state.count == 0) return const SizedBox.shrink();

    return ScaleTransition(
      scale: _controller,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          '${state.count}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
