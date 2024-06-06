import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_app/models/user.model.dart' as model;

import 'package:meta_app/resource/storage_methods.dart';

import '../models/message.model.dart';
import '../models/room.model.dart';
import '../models/user.model.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<model.UserModel> getUserDetails() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot snap = await _firestore.collection("users").doc(currentUser.uid).get();
      return model.UserModel.fronSnap(snap);
    } else {
      throw Exception("Current user is null.");
    }
  }


  // sign up user
  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        // add user to database
        model.UserModel user = model.UserModel(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          profilePictureUrl: photoUrl,
          friendRequests: [],
          friends: [],
        );

        await _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential= await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Future<List<UserModel>> fetchUsersExceptCurrent() async {
  //   List<UserModel> userList = [];
  //   try {
  //     User? currentUser = FirebaseAuth.instance.currentUser;
  //     if (currentUser != null) { // Check if currentUser is not null
  //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //           .collection('users')
  //           .where('uid', isNotEqualTo: currentUser.uid)
  //           .get();
  //
  //       for (var doc in querySnapshot.docs) {
  //         userList.add(UserModel.fronSnap(doc));
  //       }
  //     } else {
  //
  //       print("No current user found. Returning empty list.");
  //     }
  //   } catch (e) {
  //     print("Error fetching users: $e");
  //   }
  //   return userList;
  // }

  Future<List<UserModel>> fetchUsersSortedByRecentMessages() async {
    List<UserModel> userList = [];
    Map<String, DateTime> userMessageMap = {};

    try {
      // Fetch all messages ordered by timestamp in descending order
      QuerySnapshot messageSnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .get();

      // Iterate through messages and track users with the most recent timestamps
      for (var doc in messageSnapshot.docs) {
        var message = MessageModel.fronSnap(doc);
        if (!userMessageMap.containsKey(message.senderId)) {
          userMessageMap[message.senderId] = message.timestamp;
        }
      }

      // Fetch user details for each unique user ID
      for (var userId in userMessageMap.keys) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userSnapshot.exists) {
          userList.add(UserModel.fronSnap(userSnapshot));
        }
      }

      // Sort users based on the most recent message timestamp
      userList.sort((a, b) => userMessageMap[b.uid]!.compareTo(userMessageMap[a.uid]!));
    } catch (e) {
      print("Error fetching users sorted by recent messages: $e");
    }

    return userList;
  }

  Future<List<UserModel>> fetchAllUser() async {
    List<UserModel> userList = [];
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) { // Check if currentUser is not null
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .get();

        for (var doc in querySnapshot.docs) {
          userList.add(UserModel.fronSnap(doc));
        }
      } else {

        print("No current user found. Returning empty list.");
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
    return userList;
  }

  Future<List<ChatRoom>> fetchJoinedChatRooms() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('chatRooms')
        .where('users', arrayContains: currentUser.email)
        .get();

    return snapshot.docs.map((doc) => ChatRoom.fromSnap(doc)).toList();
  }

  // Fetch users except current user
  Future<List<UserModel>> fetchUsersExceptCurrent() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isNotEqualTo: currentUser.uid)
        .get();

    return snapshot.docs.map((doc) => UserModel.fronSnap(doc)).toList();
  }



}

//
// await _firestore.collection("users").add({
//   'username' : username,
//   'uid' : cred.user!.uid,
//   'email': email,
//   'bio' : bio,
//   'followers' : [],
//   'following' : []
// });
