import 'package:flutter/material.dart';
import 'package:meta_app/widgets/messenger/ms_avatar_note_widget.dart';

class MessengerListAvatarNoteWidget extends StatelessWidget {
  const MessengerListAvatarNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),
            MessengerAvatarNoteWidget(),

          ],
        ),
      ),
    );
  }
}
