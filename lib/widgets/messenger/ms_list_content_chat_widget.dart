import 'package:flutter/material.dart';

class MessengerListContentChatWidget extends StatefulWidget {
  final List<Message> listMessage;
  const MessengerListContentChatWidget({required this.listMessage, super.key});


  @override
  _MessengerListContentChatWidgetState createState() => _MessengerListContentChatWidgetState();
}

class _MessengerListContentChatWidgetState extends State<MessengerListContentChatWidget> {
  bool _isMe = true;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: listContentMessage(widget.listMessage)
        ),
      );
  }


  List<Widget> listContentMessage(List<Message> messages) {
    List<Widget> listWidgets = [];

    for (int i = 0; i < messages.length; i++) {
      Message currentMessage = messages[i];
      bool isMe = currentMessage.isMe;

      EdgeInsets margin = const EdgeInsets.only(bottom: 10, top: 3);
      bool isSendByUser = (i < (messages.length - 1) && messages[i].isMe == messages[i + 1].isMe);
      if (isSendByUser) {
        margin = const EdgeInsets.only(top: 3);
      }

      Widget rowWidget = Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              decoration:  BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/testImage.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: isSendByUser ? const BorderRadius.all(Radius.circular(10)) : const BorderRadius.all(Radius.circular(20)),
              ),
            ),
          Container(
            margin: margin,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMe ? const Color.fromRGBO(113, 116, 254, 1.0) : const Color.fromRGBO(48, 48, 48, 1.0),
              borderRadius: isSendByUser ? const BorderRadius.all(Radius.circular(15)) : const BorderRadius.all(Radius.circular(20)),
            ),
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              currentMessage.text,
              style: const TextStyle(color: Colors.white),
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

      listWidgets.add(rowWidget);
    }

    return listWidgets;
  }

}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}