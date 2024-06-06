

import 'package:flutter/material.dart';
import 'package:meta_app/models/messenger/communicate.model.dart';


class MessengerCommunityWidget extends StatelessWidget {
  final Communicate communicate;
  const MessengerCommunityWidget({super.key, required this.communicate});

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
                image:  DecorationImage(
                  image: AssetImage(communicate.photoUrl),fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10)
              ),

            ),
          ),
          Flexible(flex: 4,child: Container(
            margin: const EdgeInsets.only(left: 15),
            child: Column(

              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(communicate.name
                  ,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,

                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                   "${communicate.members.length} online"  , style: const TextStyle(fontSize: 12, color: Colors.grey),)
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
