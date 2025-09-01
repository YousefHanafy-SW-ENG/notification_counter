import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/notification_repository.dart';
import '../repositories/notification_repository_impl.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>(
      (ref) => NotificationRepositoryImpl(),
);
