import 'package:flutter/material.dart';

class MessengerListContentChatWidget extends StatefulWidget {
  @override
  _MessengerListContentChatWidgetState createState() => _MessengerListContentChatWidgetState();
}

class _MessengerListContentChatWidgetState extends State<MessengerListContentChatWidget> {
  bool _isMe = true;
  List<Message> messages = [
    Message(text: 'Hello', isMe: true),
    Message(text: 'Hi', isMe: false),
    Message(text: 'How are you?', isMe: true),
    Message(text: 'Em thật sự cảm thấy khó hiểu sao giờ có vài bạn nữ các bạn ảo mạng đến kinh khủng thế ạ . Nói chuyện với các bạn mà các bạn chỉ biết đi sân si con này xinh con này không xinh hay là con này xấu hơn mình . Chứ mình thấy các bạn cũng xinh bình thường gọi là ưa nhìn chứ có phải hotgirl đâu mà sân si kinh thế ạ .?', isMe: true),
    Message(text: 'I\'m good. What about you?', isMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: messages.map((message) {
        setState(() {
          _isMe = message.isMe;
        });
        return Row(
          mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          // crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children:[
            message.isMe == false ? Container(
              margin: const EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/434651852_1616363115799888_8289186369376195356_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGpHzSkBkVic0OCPYO63UVD_-m4t_ekG9X_6bi396Qb1dd5Khx8vcJPIkynnT_YXJoj9gUJHXcm-Xm6f8rCq2So&_nc_ohc=GaUW8XFZTxwAX-ltYCD&_nc_ht=scontent.fhan15-2.fna&oh=00_AfDJg5UNPIvY_4nANtqyCG7-XPTtLt5qVxYH8mBnt8AIQA&oe=660EEA27"),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),) : Container(),
            Container(
              margin: _isMe ? const EdgeInsets.symmetric(vertical: 10) :const EdgeInsets.symmetric(vertical: 10) ,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: message.isMe ? const Color.fromRGBO(113, 116, 254, 1.0) : const Color.fromRGBO(
                    48, 48, 48, 1.0),
                borderRadius: BorderRadius.circular(20),
              ),
              constraints: const BoxConstraints(
                  maxWidth: 300
              ),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}