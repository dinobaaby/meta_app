import 'package:flutter/material.dart';
import 'package:meta_app/utils/facebook/fb_colors.dart';
import 'package:meta_app/widgets/facebook/fb_button_camera_action_widget.dart';
import 'package:meta_app/widgets/facebook/fb_circle_avatar.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("User name"),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down_sharp)),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      )),
      body: ListView(
        children: const [ProfileHeader()],
      ),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: more_action_fb_color,
      child: const Column(
        children: [
          Stack(
            children: [ProfileBackgroundImage(), ProfileAvatar()],
          )
        ],
      ),
    );
  }
}

class ProfileBackgroundImage extends StatefulWidget {
  const ProfileBackgroundImage({super.key});

  @override
  State<ProfileBackgroundImage> createState() => _ProfileBackgroundImageState();
}

class _ProfileBackgroundImageState extends State<ProfileBackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 210,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://3.img-dpreview.com/files/p/TS250x250~sample_galleries/3800753625/8719688791.jpg",
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: FBButtonCameraActionWidget(
              action: () {},
            ))
      ],
    );
  }
}

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
            const FBCircleAvatar(150),
            FBButtonCameraActionWidget(
              action: () {},
            )
      ],
    );
  }
}
