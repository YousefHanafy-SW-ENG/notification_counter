import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_counter/features/notifications/data/providers/notification_repository_provider.dart';
import 'package:notification_counter/features/notifications/domain/repositories/notification_repository.dart';
import 'package:notification_counter/features/notifications/presentation/providers/notification_state.dart';

class NotificationNotifier extends StateNotifier<NotificationState> {
  final NotificationRepository _repository;

  NotificationNotifier(this._repository) : super(const NotificationState());

  Future<void> loadNotifications() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final newCount = await _repository.fetchNotificationsCount();
      state = state.copyWith(count: newCount, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void reset() {
    state = state.copyWith(count: 0);
  }
}

final notificationProvider =
StateNotifierProvider<NotificationNotifier, NotificationState>(
      (ref) {
    final repo = ref.watch(notificationRepositoryProvider);
    return NotificationNotifier(repo);
  },
);
