import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/facebook/fb_colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,color: title_fb_color),),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,),
            onPressed: () {},
          ),
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
    );
  }
}
