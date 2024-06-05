import 'package:flutter/material.dart';
import 'package:meta_app/widgets/messenger/ms_avatar_note_widget.dart';
import '../../models/user.model.dart';
import '../../resource/auth.resource.dart';

class MessengerListAvatarNoteWidget extends StatelessWidget {
  const MessengerListAvatarNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<UserModel>> _usersFuture = AuthMethods().fetchUsersExceptCurrent();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder<List<UserModel>>(
          future: _usersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No users found'));
            }

            List<UserModel> users = snapshot.data!;
            return Row(
              children: users.map((user) {
                return MessengerAvatarNoteWidget(user: user);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
