

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../models/message.model.dart';

class MessageResource{
  Future<void> sendMessage(String roomId, String senderId, String content) async {
    try {
      String id = const Uuid().v1();
      MessageModel message = MessageModel(
        messageId: id,
        // Unique message id
        roomId: roomId,
        senderId: senderId,
        content: content,
        timestamp: DateTime.now(),
      );
      // Lưu message vào Firestore hoặc một nơi lưu trữ khác
      await FirebaseFirestore.instance.collection('messages').add(
          message.toMap());
    } catch (e) {
      print('Error sending message: $e');
    }
  }
  String reverseString(String input) {
    String a = input.substring(0, 28);
    String b = input.substring(28, input.length);
    return b + a; // Trả về chuỗi đã đảo ngược
  }

  Future<List<MessageModel>> loadMessages(String roomId) async {
    String a = reverseString(roomId);
    print(roomId);
    print(a);
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('roomId', whereIn: [a, roomId])
          .orderBy('timestamp')
          .get();

      List<MessageModel> messages = [];
      for (var doc in querySnapshot.docs) {
        messages.add(MessageModel.fronSnap(doc));
      };
      return messages;
    } catch (e) {
      print('Error loading messages: $e');
      return [];
    }
  }
  Future<void> deleteMessage(String messageId) async {
    try {
      await FirebaseFirestore.instance.collection('messages').doc(messageId).delete();
    } catch (e) {
      print('Error deleting message: $e');
    }
  }
  Future<void> editMessage(String messageId, String newContent) async {
    try {
      await FirebaseFirestore.instance.collection('messages').doc(messageId).update({
        'content': newContent,
      });
    } catch (e) {
      print('Error editing message: $e');
    }
  }
}