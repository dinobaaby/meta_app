import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String roomId;
  final String roomName;
  final String roomImage;
  final List<String> users;
  final DateTime lastMessageTime;

  ChatRoom({
    required this.roomId,
    required this.roomName,
    required this.users,
    required this.lastMessageTime,
    required this.roomImage
  });

  static ChatRoom fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return ChatRoom(
      roomId: data['roomId'],
      roomName: data['roomName'],
      roomImage: data['roomImage'],
      users: List<String>.from(data['users']),
      lastMessageTime: (data['lastMessageTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'roomName': roomName,
      'users': users,
      'lastMessageTime': lastMessageTime,
      'roomImage' : roomImage
    };
  }
}
