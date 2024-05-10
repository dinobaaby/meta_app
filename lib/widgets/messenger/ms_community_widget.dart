

import 'package:flutter/material.dart';


class MessengerCommunityWidget extends StatelessWidget {
  const MessengerCommunityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.zero,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/testImage.jpg"),fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10)
              ),

            ),
          ),
          Flexible(flex: 4,child: Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Column(

              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Hi anh em lai la hoang thich blu day",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,


                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text("5790 online", style: TextStyle(fontSize: 12, color: Colors.grey),)
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
