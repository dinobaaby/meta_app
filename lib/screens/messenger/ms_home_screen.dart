import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/screens/messenger/create_new_message_screen.dart';
import 'package:meta_app/screens/messenger/ms_search_screen.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/ms_drawer_widget.dart';
import 'package:meta_app/widgets/messenger/ms_list_avatar_note_widget.dart';
import 'package:meta_app/widgets/messenger/ms_list_chat_widget.dart';
import 'package:meta_app/widgets/messenger/ms_search_widget.dart';

import '../../widgets/messenger/ms_avatar_note_widget.dart';

class MessengerHomeScreen extends StatefulWidget {
  const MessengerHomeScreen({super.key});

  @override
  State<MessengerHomeScreen> createState() => _MessengerHomeScreenState();
}

class _MessengerHomeScreenState extends State<MessengerHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ms_background_color,
          appBar: AppBar(
            backgroundColor: ms_background_color,
            title: const Text("Chats", style: TextStyle(color: title_ms_color, fontSize: 20, fontWeight: FontWeight.bold),),
            centerTitle: true,
            leading: Builder(
              builder: (context) => Container(

                child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu),

                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateNewMessageScreen())), icon: const Icon(FontAwesomeIcons.pen, size: 18,))
            ],
          ),
          drawer: const MessengerDrawerWidget(),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  MessengerSearchWidget(),
                  MessengerListAvatarNoteWidget(),
                  MessengerListChatWidget(),
                ],
              ),
            ),
          )


        ),

    );
  }
}
