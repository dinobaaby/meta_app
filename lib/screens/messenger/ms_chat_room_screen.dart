import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../models/message.model.dart';
import '../../models/room.model.dart';
import '../../models/user.model.dart';
import '../../providers/user.provider.dart';
import '../../resource/messenger/messge.resource.dart';
import '../../resource/messenger/rooms.resource.dart';
import '../../resource/storage_methods.dart';
import '../../utils/messenger/ms_colors.dart';
import '../../utils/messenger/ms_utils.dart';
import '../../utils/utils.dart';
import 'ms_setting_chat_screen.dart';

class MsChatRoomScreen extends StatefulWidget {
  final String roomId;

  const MsChatRoomScreen({super.key, required this.roomId});

  @override
  State<MsChatRoomScreen> createState() => _MsChatRoomScreenState();
}

class _MsChatRoomScreenState extends State<MsChatRoomScreen> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _sentController = TextEditingController();
  String _content = "";
  Uint8List? _image;
  List<MessageModel> _messages = [];
  late Future<ChatRoom> _chatRoomFuture;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _chatRoomFuture = loadChatRoom();
    loadMessages();
  }

  Future<void> sendImageMessage(String roomId, String senderId) async {
    Uint8List? selectedImage = await pickImage(ImageSource.gallery);

    if (selectedImage == null) return;

    try {
      String imageUrl = await StorageMethods().uploadImageToStorage(
        'images/messages/',
        selectedImage,
        false,
      );
      await MessageResource().sendMessage(roomId, senderId, imageUrl);
      loadMessages(); // Reload messages after sending an image
    } catch (e) {
      print('Error sending image message: $e');
    }
  }

  Future<void> loadMessages() async {
    try {
      List<MessageModel> messages = await MessageResource().loadMessages(widget.roomId);
      setState(() {
        _messages = messages;
      });
    } catch (e) {
      print('Error loading messages: $e');
    }
  }

  Future<ChatRoom> loadChatRoom() async {
    return await RoomResource().loadChatRoom(widget.roomId);
  }

  @override
  void dispose() {
    super.dispose();
    _sentController.dispose();
    _focusNode.dispose();
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
                        image: AssetImage("assets/images/testImage.jpg"),
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ms_background_color,
          title: FutureBuilder<ChatRoom>(
            future: _chatRoomFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('Chat room not found'));
              }
              ChatRoom chatRoom = snapshot.data!;
              return InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MsSettingChatScreen())),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(chatRoom.roomImage),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chatRoom.roomName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Active now",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone, color: Colors.purple),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_camera_back, color: Colors.purple),
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.purple),
        ),
        backgroundColor: ms_background_color,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('messages').where('roomId', isEqualTo: widget.roomId).orderBy("timestamp").snapshots(),
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
        ),
        bottomSheet: Container(
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: ms_background_color,
          ),
          child: Row(
            children: [
              (!_isFocused
                  ? Row(
                children: [
                  actionMethod(
                    sizewidth: 40,
                    sizeheight: 40,
                    onPressed: () {},
                    iconData: Icons.add_circle,
                    color: action_appbar_ms_color,
                  ),
                  actionMethod(
                    sizewidth: 40,
                    sizeheight: 40,
                    onPressed: () {},
                    iconData: Icons.camera_alt,
                    color: action_appbar_ms_color,
                  ),
                  actionMethod(
                    sizewidth: 40,
                    sizeheight: 40,
                    onPressed: () => sendImageMessage(widget.roomId, userc.uid),
                    iconData: Icons.image,
                    color: action_appbar_ms_color,
                  ),
                  actionMethod(
                    sizewidth: 40,
                    sizeheight: 40,
                    onPressed: () {},
                    iconData: Icons.mic,
                    color: action_appbar_ms_color,
                  ),
                ],
              )
                  : actionMethod(
                sizewidth: 40,
                sizeheight: 40,
                onPressed: () {},
                iconData: Icons.arrow_forward_ios_sharp,
                color: action_appbar_ms_color,
              )),
              Container(
                width: _isFocused ? MediaQuery.of(context).size.width * 1 - 100 : 180,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(96, 90, 90, 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: TextField(
                  focusNode: _focusNode,
                  controller: _sentController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nhắn tin",
                    contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: Icon(
                      (_content.isNotEmpty ? Icons.search : Icons.insert_emoticon_sharp),
                      color: Colors.blue,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _content = value;
                    });
                  },
                ),
              ),
              actionMethod(
                sizewidth: 40,
                sizeheight: 40,
                onPressed: () async {
                  if (_sentController.text.isNotEmpty) {
                    await MessageResource().sendMessage(widget.roomId, userc.uid, _sentController.text);
                    setState(() {
                      _sentController.text = "";
                      _content = "";
                    });
                    loadMessages(); // Reload messages after sending a text message
                  }
                },
                iconData: (_content.isNotEmpty ? Icons.send : Icons.thumb_up),
                color: (_content.isNotEmpty ? Colors.blueAccent : Colors.blueAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox actionMethod({
    required double sizewidth,
    required double sizeheight,
    required IconData iconData,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return SizedBox(
      width: sizewidth,
      height: sizeheight,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: 25,
          color: color,
        ),
      ),
    );
  }
}
