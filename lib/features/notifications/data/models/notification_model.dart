import '../../domain/entities/notification.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({required super.count});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(count: json['count'] as int);
  }
}
