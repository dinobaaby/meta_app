import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/models/users.model.dart';
import 'package:meta_app/screens/facebook/fb_create_post_screen.dart';
import 'package:meta_app/services/firebase_service.dart';

import '../../models/facebook/post.model.dart';
import '../../utils/facebook/fb_colors.dart';
import '../../widgets/facebook/fb_post_widget.dart';

class HomePage extends StatefulWidget {

  final User user;
   HomePage({super.key, required this.user, });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/logos/phobo_logo.svg",
          color: button_fb_color,
          height: 64,
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.search, size: 20),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.facebookMessenger, size: 20),
          )
        ],
      ),
      body: StreamBuilder<List<PostFacebookModel>>(
        stream: _authService.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<PostFacebookModel> posts = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                color: more_action_fb_color,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child:CircleAvatar(
                              backgroundImage: NetworkImage(widget.user.avatarUrl),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  CreatePostScreen(user: widget.user)
                                      )
                                  );
                                },
                                child: const Text("What's your mind ?"),
                              )),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.photo_library,
                              color: Colors.green,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        PostFacebookModel post = posts[index];
                        return FBPostWidget(post: post);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
