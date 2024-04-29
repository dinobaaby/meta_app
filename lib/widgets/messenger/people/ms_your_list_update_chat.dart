import 'package:flutter/material.dart';

class MessengerYourListUpdateChat extends StatelessWidget {
  const MessengerYourListUpdateChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Facebook updates (19)", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),),
              Text("See more",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500, fontSize: 15),),
            ],
          ),

        ],
      ),
    );
  }
}
