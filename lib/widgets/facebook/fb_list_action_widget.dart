import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class FB_ListAction extends StatefulWidget {
  const FB_ListAction({super.key});

  @override
  State<FB_ListAction> createState() => _FB_ListActionState();
}

class _FB_ListActionState extends State<FB_ListAction> {
  int visibleRowCount = 4;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FB_Action_Item(name: "Group", icons: Icons.group),
              FB_Action_Item(name: "Saved", icons: Icons.save),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FB_Action_Item(name: "Memories",icons: Icons.group),
            FB_Action_Item(name: "Pages", icons: Icons.group),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FB_Action_Item(name: "Video", icons: Icons.group),
            FB_Action_Item(name: "Marketplace", icons: Icons.group),
          ],
        ),

        if (isExpanded)
           Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FB_Action_Item(name: "Friends", icons: Icons.group),
                  FB_Action_Item(name: "Feeds", icons: Icons.group),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FB_Action_Item(name: "Avatar", icons: Icons.person),
                  FB_Action_Item(name: "Brithday", icons: Icons.group),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FB_Action_Item(name: "Dating", icons: Icons.group),
                  FB_Action_Item(name: "Events", icons: Icons.group),
                ],
              ),
            ],
          ),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFC2C2C2),
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(isExpanded ? 'Ẩn bớt' : 'Xem thêm', style:
            const TextStyle(color: Colors.black),)
          ),
        ),
      ],
    );
  }
}


class FB_Action_Item extends StatefulWidget {
  final String name;
  final IconData icons;

   FB_Action_Item({super.key, required this.name, required this.icons});

  @override
  State<FB_Action_Item> createState() => _FB_Action_ItemState();
}

class _FB_Action_ItemState extends State<FB_Action_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2.3,
      height: 80,
      margin:const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 0.5,
          ),
        ],
        color: Colors.white,
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:const EdgeInsets.only(left: 10),
            child:  Icon(widget.icons, color: Colors.blueAccent,),
          ),
          Container(
            padding:const EdgeInsets.only(left: 5),
            child:  Text(
              widget.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

