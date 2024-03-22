import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/widgets/facebook/fb_video_posts_widget.dart';

import '../../utils/facebook/fb_colors.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,color: title_fb_color),),
        actions: [
          IconButton(
            icon: const Icon(Icons.person,),
            onPressed: () {},
          ),
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body: ListView(
        children: const [
          FBVideoPostsWidget(),
          FBVideoPostsWidget(),
          FBVideoPostsWidget()
        ]
      ),
    );
  }
}
