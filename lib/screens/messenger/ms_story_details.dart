import 'package:flutter/material.dart';
import 'package:meta_app/models/messenger/story.model.dart';
import 'package:meta_app/widgets/messenger/stories/ms_story_video_widget.dart';


class MessengerStoryDetails extends StatefulWidget {
  final Story story;
  const MessengerStoryDetails({super.key, required this.story});

  @override
  State<MessengerStoryDetails> createState() => _MessengerStoryDetailsState();
}

class _MessengerStoryDetailsState extends State<MessengerStoryDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: MsStoryVideoWidget()


      )
    );
  }
}
