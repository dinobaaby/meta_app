


import 'package:cloud_firestore/cloud_firestore.dart';

class Communicate {
  String uid;
  String name;
  String managerID;
  String photoUrl;
  String bio;
  List<String> members;

  Communicate({
    required this.uid,
    required this.name,
    required this.managerID,
    required this.photoUrl,
    required this.bio,
    required this.members,

  });

  static Communicate fronSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return Communicate(
      uid: data['uid'],
      name: data['name'],
      managerID: data['managerID'],
      photoUrl: data['photoUrl'],
      bio: data['bio'],
      members: List<String>.from(data['members']),

    );
  }
  Future<Communicate?> fetchCommunicateFromFirestore(String uid) async {
    try {
      DocumentSnapshot snap = await FirebaseFirestore.instance.collection('communicates').doc(uid).get();
      if (snap.exists) {
        return Communicate.fronSnap(snap);
      }
    } catch (e) {
      print("Error fetching communicate info: $e");
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'managerID': managerID,
      'photoUrl': photoUrl,
      'bio': bio,
      'members': members,
     
    };
  }
}