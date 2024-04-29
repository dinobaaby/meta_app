import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/widgets/facebook/fb_shorcut_widget.dart';

import '../../utils/facebook/fb_colors.dart';
import '../../widgets/facebook/FB_List_Button.dart';
import '../../widgets/facebook/fb_list_action_widget.dart';

class MenusPage extends StatelessWidget {
  const MenusPage({super.key});

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
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text("VH"),
                        ),
                        SizedBox(width: 8,),
                        Text("Nguyễn Việt Hoàng"),
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
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text("Your Shortcuts")
                    ),
                    FB_ShortcutWidget(),
                    SizedBox(height: 10,),
                    FB_ListAction(),
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
