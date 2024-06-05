import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String username;
  String email;
  String profilePictureUrl;
  String bio;
  List<String> friends;
  List<String> friendRequests;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.profilePictureUrl,
    required this.bio,
    required this.friends,
    required this.friendRequests,
  });

  static UserModel fronSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      username: data['username'],
      email: data['email'],
      profilePictureUrl: data['profilePictureUrl'],
      bio: data['bio'],
      friends: List<String>.from(data['friends']),
      friendRequests: List<String>.from(data['friendRequests']),
    );
  }
   Future<UserModel?> fetchUserFromFirestore(String uid) async {
    try {
      DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (snap.exists) {
        return UserModel.fronSnap(snap);
      }
    } catch (e) {
      print("Error fetching user info: $e");
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'bio': bio,
      'friends': friends,
      'friendRequests': friendRequests,
    };
  }
}
