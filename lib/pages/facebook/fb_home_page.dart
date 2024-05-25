import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/models/facebook/post.model.dart';
import 'package:meta_app/screens/facebook/fb_create_post_screen.dart';
import 'package:meta_app/widgets/facebook/fb_post_widget.dart';

import '../../utils/facebook/fb_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: SingleChildScrollView(
        child: Container(
          color: more_action_fb_color,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        child: Text("VH")
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CreatePostScreen()),
                            );
                          },
                          child: const Text("What's your mind ?"),
                        )
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(
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
                  return FBPostWidget(post: posts[index]);
                },
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
