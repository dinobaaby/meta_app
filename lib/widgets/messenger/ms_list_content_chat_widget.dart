import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/utils/messenger/ms_utils.dart';

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
      bool isContent = isImage(messages[i].text);

      EdgeInsets margin = const EdgeInsets.only(bottom: 10, top: 3);
      bool isSendByUser = (i < (messages.length - 1) && messages[i].isMe == messages[i + 1].isMe);
      bool isCheckMessage = (i > 0 && messages[i].isMe == messages[i - 1].isMe);
      if (isSendByUser) {
        margin = const EdgeInsets.only(top: 5);
      }


      Widget chatItem =  Container(
        margin: margin,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMe ? const Color.fromRGBO(113, 116, 254, 1.0) : const Color.fromRGBO(48, 48, 48, 1.0),
          borderRadius: isSendByUser
              ? const BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft:Radius.circular(5), topLeft:Radius.circular(15),topRight: Radius.circular(15)  )
              : (isCheckMessage ?const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft:Radius.circular(15), topLeft:Radius.circular(5),topRight: Radius.circular(5)  ) : const BorderRadius.all(Radius.circular(20))),
            // isSendByUser ? const BorderRadius.all(Radius.circular(15)) : const BorderRadius.all(Radius.circular(20))
        ),
        constraints: const BoxConstraints(maxWidth: 300),
        child: Text(
          currentMessage.text,
          style: const TextStyle(color: Colors.white),
          maxLines: 20,
          overflow: TextOverflow.ellipsis,
        ),
      );
      if(isContent){
        chatItem = Container(
          margin: margin,
          width: 200,
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isMe ? const Color.fromRGBO(113, 116, 254, 1.0) : const Color.fromRGBO(48, 48, 48, 1.0),
              borderRadius: isSendByUser ? 
              const BorderRadius.all(
                Radius.circular(10)
              ) :
              const BorderRadius.all(
                  Radius.circular(20)
              ),
              image: DecorationImage(
                  image: NetworkImage(messages[i].text),
                  fit: BoxFit.cover
              ),
            
          ),
        );
      }

      Widget rowWidget = Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,

        crossAxisAlignment: !isSendByUser ?  CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isMe && !isSendByUser)
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                ),
                Container(
                  margin:!isSendByUser ?  const EdgeInsets.only(bottom: 10, right: 5)  : const EdgeInsets.only(right: 10),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    image:  DecorationImage(
                      image: AssetImage("assets/images/testImage.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:  BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                  ),
                )

              ],
            )
          else
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 40,
              height: 40,

            ),
          chatItem


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