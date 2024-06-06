import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../models/message.model.dart';
import '../../models/room.model.dart';

class RoomResource{
  Future<void> createChatRoom(String roomName, String roomImage, List<String> users) async {
    var uuid = Uuid();
    String roomId = uuid.v4();
    ChatRoom chatRoom = ChatRoom(
      roomId: roomId,
      roomName: roomName,
      roomImage: roomImage,
      users: users,
      lastMessageTime: DateTime.now(),
    );

    await FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(roomId)
        .set(chatRoom.toJson());
  }
  Future<void> joinChatRoom(String roomId, String userId) async {
    DocumentReference chatRoomDoc = FirebaseFirestore.instance.collection('chatRooms').doc(roomId);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(chatRoomDoc);
      if (!snapshot.exists) {
        throw Exception("Chat room does not exist!");
      }

      List<String> users = List<String>.from(snapshot.get('users'));
      if (!users.contains(userId)) {
        users.add(userId);
        transaction.update(chatRoomDoc, {'users': users});
      }
    });
  }

  Future<void> sendMessage(String roomId, String senderId, String content) async {
    var uuid = Uuid();
    String messageId = uuid.v4();
    MessageModel message = MessageModel(
      messageId: messageId,
      roomId: roomId,
      senderId: senderId,
      content: content,
      timestamp: DateTime.now(),
    );

    await FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(roomId)
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());

    await FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(roomId)
        .update({'lastMessageTime': DateTime.now()});
  }

  Stream<List<MessageModel>> fetchMessages(String roomId) {
    return FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(roomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => MessageModel.fronSnap(doc))
        .toList());
  }
  Future<ChatRoom> loadChatRoom(String roomId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('chatRooms').doc(roomId).get();
    if (doc.exists) {
      return ChatRoom.fromSnap(doc);
    } else {
      throw Exception('Chat room not found');
    }
  }


  Future<String> _uploadImageToStorage(Uint8List image) async {
    String fileName = Uuid().v4();
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('chatRoomImages/$fileName');
    UploadTask uploadTask = storageReference.putData(image);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }




}