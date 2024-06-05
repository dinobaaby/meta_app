class NotificationModel {
  String notificationId;
  String userId;
  String type;
  String content;
  DateTime timestamp;
  bool read;

  NotificationModel({
    required this.notificationId,
    required this.userId,
    required this.type,
    required this.content,
    required this.timestamp,
    required this.read,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> data) {
    return NotificationModel(
      notificationId: data['notificationId'],
      userId: data['userId'],
      type: data['type'],
      content: data['content'],
      timestamp: DateTime.parse(data['timestamp']),
      read: data['read'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'userId': userId,
      'type': type,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'read': read,
    };
  }
}
