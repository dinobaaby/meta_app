import 'package:flutter/material.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/ms_drawer_widget.dart';
import 'package:meta_app/widgets/messenger/people/ms_your_list_update_chat.dart';

import '../../widgets/messenger/people/ms_your_list_community.dart';

class MessengerPeopleScreen extends StatefulWidget {
  const MessengerPeopleScreen({super.key});

  @override
  State<MessengerPeopleScreen> createState() => _MessengerPeopleScreenState();
}

class _MessengerPeopleScreenState extends State<MessengerPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ms_background_color,
          drawer: const MessengerDrawerWidget(),
          appBar: AppBar(
            backgroundColor: ms_background_color,
            title: const Text("People", style: TextStyle(color: title_ms_color, fontSize: 20, fontWeight: FontWeight.bold),),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.person_rounded))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  MessengerYourListCommunity(),
                  MessengerYourListUpdateChat()
                ],
              ),
            ),
          ),
        )
    );
  }
}
