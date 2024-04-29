import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_app/screens/messenger/ms_chat_screen.dart';
import 'package:meta_app/screens/messenger/ms_note_screen.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';

class MessengerAvatarNoteWidget extends StatefulWidget {
  const MessengerAvatarNoteWidget({super.key});

  @override
  State<MessengerAvatarNoteWidget> createState() =>
      _MessengerAvatarNoteWidgetState();
}

class _MessengerAvatarNoteWidgetState extends State<MessengerAvatarNoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 100,

          alignment: Alignment.center,
        ),
        Positioned(
          top: 20,
          left: 18,
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/434163810_1151194212690675_8393077874314169787_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFcaq6mRwqmqKIui87tO0Vmgzkqmiop656DOSqaKinrnoUFbcpOaON2MvSrpoJKPZykmvRI1-zk9DBg48yLpccA&_nc_ohc=GRkr59DCx_4AX_EBgKw&_nc_ht=scontent.fhan5-8.fna&oh=00_AfAAjVZY7rVcdwZLqtL7l2F9BCtDKc8F4xJuRl_vj2T4lg&oe=660EE3FE"
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessengerChatScreen())),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 8,
          child: Transform.translate(
            offset: Offset(-1, -10),
            child: Container(
              width: 60,
              height: 30,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessengerNoteScreen())),
                child: const Text(
                  "Share a throughout not",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 20,
            right: 5,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ms_background_color , width: 3)
              ),

            )
        ),
        Positioned(
            bottom: 5,
            left: 20,

            child: Text("Your name", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),)
        )
      ],
    );
  }
}
