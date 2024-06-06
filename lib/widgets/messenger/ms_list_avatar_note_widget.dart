import 'package:flutter/material.dart';
import 'package:meta_app/resource/messenger/note.resource.dart';
import '../../models/messenger/note.model.dart';
import '../../models/user.model.dart';
import '../../resource/auth.resource.dart';
import '../../widgets/messenger/ms_avatar_note_widget.dart';

class MessengerListAvatarNoteWidget extends StatelessWidget {
  const MessengerListAvatarNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<UserModel, NoteModel>>> _usersAndNotesFuture = NoteResource().fetchUsersAndRecentNotes();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder<List<Map<UserModel, NoteModel>>>(
          future: _usersAndNotesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Fetch all users as a fallback
              return FutureBuilder<List<UserModel>>(
                future: AuthMethods().fetchAllUser(),
                builder: (context, allUsersSnapshot) {
                  if (allUsersSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (allUsersSnapshot.hasError) {
                    return Center(child: Text('Error: ${allUsersSnapshot.error}'));
                  }
                  if (!allUsersSnapshot.hasData || allUsersSnapshot.data!.isEmpty) {
                    return const Center(child: Text('No users found'));
                  }

                  List<UserModel> allUsers = allUsersSnapshot.data!;
                  return Row(
                    children: allUsers.map((user) {
                      return MessengerAvatarNoteWidget(
                        user: user,
                        note: NoteModel(noteId: '', content: '', uid: user.uid, createAt: DateTime.now()),
                      );
                    }).toList(),
                  );
                },
              );
            }

            List<Map<UserModel, NoteModel>> usersAndNotes = snapshot.data!;
            return Row(
              children: usersAndNotes.map((userNoteMap) {
                var user = userNoteMap.keys.first;
                var note = userNoteMap.values.first;
                return MessengerAvatarNoteWidget(user: user, note: note);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
