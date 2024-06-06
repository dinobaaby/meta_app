


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/messenger/note.model.dart';
import '../../models/user.model.dart';

class NoteResource{
  Future<Map<UserModel, NoteModel>> fetchUsersWithRecentNotes() async {
    Map<UserModel, NoteModel> userNotesMap = {};

    try {
      // Fetch all notes ordered by creation time in descending order
      QuerySnapshot noteSnapshot = await FirebaseFirestore.instance
          .collection('notes')
          .orderBy('createAt', descending: true)
          .get();

      Set<String> userIds = {};

      // Collect unique user IDs
      for (var doc in noteSnapshot.docs) {
        var note = NoteModel.fromSnap(doc);
        if (!userIds.contains(note.uid)) {
          userIds.add(note.uid);
        }
      }

      // Fetch user details for each unique user ID
      for (var userId in userIds) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userSnapshot.exists) {
          var user = UserModel.fronSnap(userSnapshot);
          // Find the most recent note for this user
          var recentNoteDoc = noteSnapshot.docs.firstWhere((doc) => doc['uid'] == user.uid);
          var recentNote = NoteModel.fromSnap(recentNoteDoc);

          userNotesMap[user] = recentNote;
        }
      }
    } catch (e) {
      print("Error fetching users with recent notes: $e");
    }

    return userNotesMap;
  }

  Future<List<Map<UserModel, NoteModel>>> fetchUsersAndRecentNotes() async {
    List<Map<UserModel, NoteModel>> userNotesList = [];

    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Fetch users excluding the current user
        QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('uid', isNotEqualTo: currentUser.uid)
            .get();

        for (var userDoc in userSnapshot.docs) {
          var user = UserModel.fronSnap(userDoc);

          // Fetch the most recent note for each user
          QuerySnapshot noteSnapshot = await FirebaseFirestore.instance
              .collection('notes')
              .where('uid', isEqualTo: user.uid)
              .orderBy('createAt', descending: true)
              .limit(1)
              .get();

          if (noteSnapshot.docs.isNotEmpty) {
            var note = NoteModel.fromSnap(noteSnapshot.docs.first);
            userNotesList.add({user: note});
          } else {
            userNotesList.add({
              user: NoteModel(noteId: '', content: '', uid: user.uid, createAt: DateTime.now())
            });
          }
        }
      }
    } catch (e) {
      print("Error fetching users and notes: $e");
    }

    return userNotesList;
  }


}