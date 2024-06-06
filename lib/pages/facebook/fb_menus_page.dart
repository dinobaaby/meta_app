import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/widgets/facebook/fb_shorcut_widget.dart';

import '../../models/users.model.dart';
import '../../utils/facebook/fb_colors.dart';
import '../../widgets/facebook/fb_list_button.dart';
import '../../widgets/facebook/fb_list_action_widget.dart';

class MenusPage extends StatefulWidget {
  final User user;
   MenusPage({super.key, required this.user});

  @override
  State<MenusPage> createState() => _MenusPageState();
}

class _MenusPageState extends State<MenusPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffeff0f4) ,
      appBar: AppBar(
        backgroundColor: const Color(0xffeff0f4),
        title: const Text('Menu',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,color: title_fb_color),),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,),
            onPressed: () {},
          ),
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body:  SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal:8, vertical: 10) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 10) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.user.avatarUrl),
                        ),
                        const SizedBox(width: 8,),
                        Text(widget.user.name),
                      ],
                    ),
                    FloatingActionButton.small(
                      backgroundColor: const Color(0xffeff0f4),
                      elevation: 0,
                      shape: const CircleBorder(),
                        onPressed: () =>{},
                        child: const Icon(Icons.keyboard_arrow_down),
                    )
                  ]
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child:Text("Your Shortcuts")
                    ),
                    const FB_ShortcutWidget(),
                    const SizedBox(height: 10,),
                    const FB_ListAction(),
                    FB_List_Button()
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
