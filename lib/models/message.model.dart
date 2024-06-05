import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MessageModel {
  String messageId;
  String roomId;
  String senderId;
  String content;
  DateTime timestamp;

  MessageModel({
    required this.messageId,
    required this.roomId,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  static MessageModel fronSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return MessageModel(
      messageId: data['messageId'],
      roomId: data['roomId'],
      senderId: data['senderId'],
      content: data['content'],
      timestamp: DateTime.parse(data['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'roomId': roomId,
      'senderId': senderId,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }




}
