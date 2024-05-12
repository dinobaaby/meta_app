import 'package:flutter/material.dart';
import 'package:meta_app/widgets/messenger/stories/ms_story_video_widget.dart';


class MessengerStoryDetails extends StatefulWidget {
  const MessengerStoryDetails({super.key});

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
