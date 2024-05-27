import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/facebook/fb_colors.dart';

class MenusPage extends StatelessWidget {
  const MenusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Menu',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,color: title_fb_color),),
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
