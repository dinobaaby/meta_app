import 'package:flutter/material.dart';
import 'package:meta_app/widgets/facebook/fb_text_button_widget.dart';
import 'package:meta_app/widgets/facebook/fb_video_widget.dart';
import 'package:readmore/readmore.dart';

import '../../utils/facebook/fb_colors.dart';

class FBVideoPostsWidget extends StatefulWidget {
  const FBVideoPostsWidget({super.key});

  @override
  State<FBVideoPostsWidget> createState() => _FBVideoPostsWidgetState();
}

class _FBVideoPostsWidgetState extends State<FBVideoPostsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('AH'),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 12, color: button_bottombar_not_selected),
                    ),
                    Row(
                      children: [
                        Text(
                          "Time - ",
                          style: TextStyle(
                              fontSize: 8,
                              color: button_bottombar_not_selected),
                        ),
                        Icon(
                          Icons.public,
                          size: 12,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            trimLines: 2,
            style: TextStyle(fontSize: 12, color: Colors.black),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            moreStyle: TextStyle(fontSize: 11),
          ),
          const SizedBox(
            height: 10,
          ),
          const VideoWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: listButton.map((e) => e).toList(),
          )
        ],
      ),
    );
  }
}
