import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meta_app/resource/auth.resource.dart';

class MessengerYourListUpdateChat extends StatelessWidget {
  const MessengerYourListUpdateChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Facebook updates (19)", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),),
              Text("See more",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500, fontSize: 15),),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/testImage.jpg'),
                    ),
                    SizedBox(width: 20,),
                    Text("Nguyễn Việt Hoàng", style: TextStyle(color: Colors.white, fontSize: 16),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/testImage.jpg'),
                    ),
                    SizedBox(width: 20,),
                    Text("Nguyễn Thế Huy Hoàng", style: TextStyle(color: Colors.white, fontSize: 16),)
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
