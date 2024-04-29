import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/widgets/messenger/ms_community_widget.dart';

class MessengerYourListCommunity extends StatelessWidget {
  const MessengerYourListCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Chat in your communities", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),),
              Text("See more",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500, fontSize: 15),),

            ],
          ),
          MessengerCommunityWidget(),
          MessengerCommunityWidget(),
          MessengerCommunityWidget(),

        ],
      ),
    );
  }
}
