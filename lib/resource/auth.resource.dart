import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_app/models/user.model.dart' as model;

import 'package:meta_app/resource/storage_methods.dart';

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

  Future<List<UserModel>> fetchUsersExceptCurrent() async {
    List<UserModel> userList = [];
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        QuerySnapshot querySnapshot =await  FirebaseFirestore.instance
            .collection('users')
            .where('uid',
            isNotEqualTo: currentUser.uid)
            .get();

        for (var doc in querySnapshot.docs) {
          userList.add(UserModel.fronSnap(doc));
        }
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
    return userList;
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
