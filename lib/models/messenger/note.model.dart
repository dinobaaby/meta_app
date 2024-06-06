import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String noteId;
  final String uid;
  final String content;
  final DateTime createAt;

  NoteModel({
    required this.noteId,
    required this.content,
    required this.uid,
    required this.createAt,
  });

  static NoteModel fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return NoteModel(
      uid: data['uid'],
      content: data['content'],
      noteId: data['noteId'],
      createAt: (data['createAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'content': content,
      'noteId': noteId,
      'createAt': createAt.toIso8601String(),
    };
  }
}
