import 'package:notification_counter/features/notifications/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<int> fetchNotificationsCount() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 5;
  }
}
