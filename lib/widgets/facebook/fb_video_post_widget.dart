import 'package:flutter/material.dart';
import 'package:meta_app/models/facebook/video.model.dart';
import 'package:meta_app/widgets/facebook/fb_text_button_widget.dart';
import 'package:meta_app/widgets/facebook/fb_video_widget.dart';
import 'package:readmore/readmore.dart';

import '../../utils/facebook/fb_colors.dart';

class FBVideoPostsWidget extends StatefulWidget {
  final VideoFacebookModel video;

  const FBVideoPostsWidget({super.key, required this.video});
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
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.video.profileImg),
                backgroundColor: Colors.blue,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video.userName,
                      style: const TextStyle(
                          fontSize: 12, color: button_bottombar_not_selected),
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.video.createdAt} - ",
                          style: const TextStyle(
                              fontSize: 8,
                              color: button_bottombar_not_selected),
                        ),
                        const Icon(
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
          ReadMoreText(
            widget.video.content,
            trimLines: 2,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            moreStyle: const TextStyle(fontSize: 11),
          ),
          const SizedBox(
            height: 10,
          ),
          VideoWidget(
            videoUrl:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
          ),
          Row(
            children: listButton.map((e) => e).toList(),
          )
        ],
      ),
    );
  }
}
