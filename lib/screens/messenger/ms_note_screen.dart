import 'package:flutter/material.dart';
import 'package:meta_app/models/messenger/note.model.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';

class MessengerNoteScreen extends StatefulWidget {
  final NoteModel note;
  const MessengerNoteScreen({super.key, required this.note});

  @override
  State<MessengerNoteScreen> createState() => _MessengerNoteScreenState();
}

class _MessengerNoteScreenState extends State<MessengerNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ms_background_color,
        appBar: AppBar(
          backgroundColor: ms_background_color,

        ),
        body: const Center(
          child: Text("HI", style: TextStyle(color: Colors.white),),
        ),

      ),
    );
  }
}
