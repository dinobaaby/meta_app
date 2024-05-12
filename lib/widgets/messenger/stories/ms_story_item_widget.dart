import 'package:flutter/material.dart';
import 'package:meta_app/screens/messenger/ms_story_details.dart';

class MessengerStoryItemWidget extends StatelessWidget {
  const MessengerStoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessengerStoryDetails()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 240,
           decoration: BoxDecoration(
             image: const DecorationImage(
               image: AssetImage("assets/images/testImage.jpg"),
                 fit: BoxFit.cover
             ),
             borderRadius: BorderRadius.circular(5)
           ),
          ),
        ),
        Positioned(
            top: 15,
            left: 15,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/images/testImage.jpg"),fit: BoxFit.cover
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.blue
                )
              ),

            )
        ),
        Positioned(
            top: 15,
            right: 10,
            child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)
                ),
            child: const Text("1", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
        )),
        const Positioned(
            bottom: 15,
            left: 15,
            child: Text("Chu minh duc", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),)
        )
      ],
    );
  }
}
