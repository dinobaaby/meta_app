import 'package:flutter/material.dart';
import 'package:meta_app/models/facebook/post.model.dart';
import 'package:meta_app/services/firebase_service.dart';
import 'package:meta_app/widgets/facebook/fb_text_button_widget.dart';
import 'package:multi_image_layout/image_model.dart';
import 'package:multi_image_layout/multi_image_viewer.dart';
import 'package:readmore/readmore.dart';

import '../../models/users.model.dart';
import '../../utils/facebook/fb_colors.dart';

class FBPostWidget extends StatefulWidget {
  final PostFacebookModel post;

  const FBPostWidget({super.key, required this.post});

  @override
  State<FBPostWidget> createState() => _FBPostWidgetState();
}

class _FBPostWidgetState extends State<FBPostWidget> {
  final AuthService _authService = AuthService();

  Future<User?> getUserById(String userId) async {
    return _authService.getUserById(userId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: getUserById(widget.post.userId),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else{
          User user = snapshot.data!;
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
                      backgroundImage: NetworkImage(user.avatarUrl),
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
                            user.name,
                            style: const TextStyle(
                                fontSize: 12, color: button_bottombar_not_selected),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.post.createdAt.toString(),
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
                  widget.post.content,
                  trimLines: 2,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  moreStyle: const TextStyle(fontSize: 11),
                ),
                const SizedBox(
                  height: 10,
                ),
                MultiImageViewer(
                  images: widget.post.imageUrls
                      .map((url) => ImageModel(imageUrl: url))
                      .toList(),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listButton.map((e) => e).toList(),
                )
              ],
            ),
          ) ;
        }
    });
  }
}
