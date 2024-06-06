import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/models/user.model.dart';
import 'package:meta_app/utils/messenger/ms_utils.dart';
import 'package:provider/provider.dart';

import '../../providers/user.provider.dart';

class MessengerListContentChatWidget extends StatefulWidget {
  final String roomId;
  final UserModel user;
  const MessengerListContentChatWidget({required this.roomId, required this.user, Key? key}) : super(key: key);

  @override
  _MessengerListContentChatWidgetState createState() => _MessengerListContentChatWidgetState();
}

class _MessengerListContentChatWidgetState extends State<MessengerListContentChatWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 20,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserModel userc = Provider.of<UserProvider>(context).getUser;
    List<Widget> listContentMessage(List<QueryDocumentSnapshot<Map<String, dynamic>>> messages) {
      List<Widget> listWidgets = [];

      for (int i = 0; i < messages.length; i++) {
        QueryDocumentSnapshot<Map<String, dynamic>> currentMessage = messages[i];
        bool isMe = currentMessage['senderId'].toString().contains(userc.uid);
        bool isContent = isImage(currentMessage['content']);


        EdgeInsets margin = const EdgeInsets.only(bottom: 10, top: 3);
        bool isSendByUser = (i < (messages.length - 1) && messages[i]['senderId'] == messages[i + 1]['senderId']);
        bool isCheckMessage = (i > 0 && messages[i]['senderId'] == messages[i - 1]['senderId']);
        if (isSendByUser) {
          margin = const EdgeInsets.only(top: 5);
        }

        Widget chatItem = Container(
          margin: margin,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isMe ? const Color.fromRGBO(113, 116, 254, 1.0) : const Color.fromRGBO(48, 48, 48, 1.0),
            borderRadius: isSendByUser
                ? const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10))
                : (isCheckMessage
                ? const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10))
                : const BorderRadius.all(Radius.circular(20))),
          ),
          constraints: const BoxConstraints(maxWidth: 300),
          child: Text(
            currentMessage['content'],
            style: const TextStyle(color: Colors.white),
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
          ),
        );

        if (isContent) {
          chatItem = Container(
            margin: margin,
            width: 200,
            height: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMe ? const Color.fromRGBO(113, 116, 254, 1.0) : const Color.fromRGBO(48, 48, 48, 1.0),
              borderRadius: isSendByUser
                  ? const BorderRadius.all(Radius.circular(10))
                  : const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(currentMessage['content']),
                fit: BoxFit.cover,
              ),
            ),
          );
        }

        Widget rowWidget = Row(
          mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: !isSendByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isMe && !isSendByUser)
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    margin: !isSendByUser ? const EdgeInsets.only(bottom: 10, right: 5) : const EdgeInsets.only(right: 10),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.user.profilePictureUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                          border: Border.all(color: Colors.black, width: 1)),
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

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('messages').where('roomId', whereIn: [widget.user.uid + userc.uid, widget.roomId, userc.uid+widget.user.uid]).orderBy("timestamp").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              children: [
                ...listContentMessage(snapshot.data!.docs), // Sử dụng spread operator ở đây
              ],
            ),
          ),
        );

      },
    );
  }
}
