import 'package:flutter/material.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/stories/ms_story_item_widget.dart';

import '../../widgets/messenger/ms_drawer_widget.dart';

class MessengerStoriesScreen extends StatefulWidget {
  const MessengerStoriesScreen({super.key});

  @override
  State<MessengerStoriesScreen> createState() => _MessengerPeopleScreenState();
}

class _MessengerPeopleScreenState extends State<MessengerStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ms_background_color,
          drawer: const MessengerDrawerWidget(),
          appBar: AppBar(
            backgroundColor: ms_background_color,
            title: const Text("Stories", style: TextStyle(color: title_ms_color, fontSize: 20, fontWeight: FontWeight.bold),),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.amp_stories_sharp))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  MessengerStoryItemWidget()
                ],
              ),
            ),
          ),
        )
    );
  }
}
