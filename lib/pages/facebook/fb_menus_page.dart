import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/widgets/facebook/fb_shorcut_widget.dart';

import '../../utils/facebook/fb_colors.dart';

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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal:8, vertical: 10) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:8, vertical: 10) ,
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
                        child: Text("VH"),
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 8,),
                      Text("Nguyễn Việt Hoàng"),
                    ],
                  ),
                  FloatingActionButton.small(
                    backgroundColor: Color(0xffeff0f4),
                    elevation: 0,
                    shape: CircleBorder(),
                      onPressed: () =>{},
                      child: Icon(Icons.keyboard_arrow_down),
                  )
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
              children: [
                Align(
                  child:Text("Your Shortcuts"),
                  alignment: Alignment.centerLeft
                ),
                FB_ShortcutWidget()

              ],
            ),)
          ]
        ),
      ),
    );
  }
}
