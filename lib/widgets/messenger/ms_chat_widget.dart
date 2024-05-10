import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/screens/messenger/ms_chat_screen.dart';
import 'package:meta_app/widgets/messenger/ms_avatar_widget.dart';

class MessengerChatWidget extends StatelessWidget {
  const MessengerChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessengerChatScreen())),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height:50,
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
          children: [
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/testImage.jpg"),fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 1,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                          border: Border.all(color: Colors.black, width: 2)
                      ),
                    )
                )
              ],
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Text(
                        "Nguyen tho quan",
                        style: TextStyle(
                            color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    Text(
                        "Nguyen tho quan",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                    ),
      
                  ],
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/testImage.jpg"),fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )
          ],
        ),
      
      ),
    );
  }
}
