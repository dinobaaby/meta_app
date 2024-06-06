import 'package:flutter/material.dart';
import 'package:meta_app/screens/messenger/ms_story_details.dart';

import '../../../models/messenger/story.model.dart';

class MessengerStoryItemWidget extends StatelessWidget {
  final Story story;

  const MessengerStoryItemWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MessengerStoryDetails(story: story),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.43,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(story.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(story.authorImageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 2,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 10,
          child: Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              story.storyCount.toString(),
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Text(
            story.authorName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
