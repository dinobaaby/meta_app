import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta_app/models/message.model.dart';
import 'package:meta_app/models/user.model.dart';
import 'package:meta_app/resource/storage_methods.dart';
import 'package:meta_app/screens/messenger/ms_setting_chat_screen.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/ms_list_content_chat_widget.dart';
import 'package:provider/provider.dart';
import '../../providers/user.provider.dart';
import '../../resource/messenger/messge.resource.dart';
import '../../utils/utils.dart';
class MessengerChatScreen extends StatefulWidget {
  final UserModel user;
  final String roomId;

  const MessengerChatScreen({super.key, required this.user, required this.roomId});

  @override
  State<MessengerChatScreen> createState() => _MessengerChatScreenState();
}

class _MessengerChatScreenState extends State<MessengerChatScreen> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _sentController = TextEditingController();
  String _content = "";
  Uint8List? _image;
  List<MessageModel> _messages = [] ;

  Future<void> sendImageMessage(String roomId, String senderId) async {
    // 1. Get the image from the gallery
    Uint8List? selectedImage = await pickImage(ImageSource.gallery);

    if (selectedImage == null) return; // User canceled image selection

    try {
      //
      // showDialog(
      //   context: context,
      //   builder: (context) => const Center(child: CircularProgressIndicator()),
      // );

      String imageUrl = await StorageMethods().uploadImageToStorage(
        'images/messages/',
        selectedImage,
        false,
      );

      await MessageResource().sendMessage(roomId, senderId, imageUrl);

    } catch (e) {
      print('Error sending image message: $e');
    } finally {
    }
  }
  @override
  void initState() {

    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;

      });

    });
    loadMessages();
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
  @override
  void dispose() {
    super.dispose();
    _sentController.dispose();
    _focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final UserModel userc = Provider.of<UserProvider>(context).getUser;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ms_background_color,
            title: InkWell(

              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MsSettingChatScreen())),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.user.profilePictureUrl),
                              fit: BoxFit.cover
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20))
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
                              border: Border.all(color: Colors.black, width: 1)
                            ),
                          )
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.user.username, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                        Text("Active now", style: TextStyle(color: Colors.grey,  fontSize: 12),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.phone, color: Colors.purple,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.video_camera_back, color: Colors.purple,))
            ],
            iconTheme: const IconThemeData(
              color: Colors.purple
            ),
          ),
          backgroundColor: ms_background_color,
          body: Container(
            height:   MediaQuery.of(context).size.height*0.82,
            child: MessengerListContentChatWidget(roomId: widget.roomId, user: widget.user,),
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
                    ?
                        Row(
                          children: [
                            actionMethod(sizewidth: 40, sizeheight: 40, onPressed: (){}, iconData: Icons.add_circle, color:action_appbar_ms_color),
                            actionMethod(sizewidth: 40, sizeheight: 40, onPressed: (){}, iconData: Icons.camera_alt, color:action_appbar_ms_color),
                            actionMethod(sizewidth: 40, sizeheight: 40, onPressed:() => sendImageMessage(widget.roomId, userc.uid), iconData: Icons.image, color:action_appbar_ms_color),
                            actionMethod(sizewidth: 40, sizeheight: 40, onPressed: (){}, iconData: Icons.mic, color:action_appbar_ms_color),
                          ]
                        )
                    :
                actionMethod(sizewidth: 40, sizeheight: 40, onPressed: (){}, iconData: Icons.arrow_forward_ios_sharp, color:action_appbar_ms_color)
                  ),
                Container(
                  width: _isFocused ? MediaQuery.of(context).size.width*1 -100: 180,
                  height: 35,
                 decoration: BoxDecoration(
                   color: const Color.fromRGBO(96, 90, 90, 1.0),
                   borderRadius: BorderRadius.circular(20)
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
                      suffixIcon: Icon((_content.isNotEmpty ? Icons.search : Icons.insert_emoticon_sharp), color: Colors.blue,),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value){
                      setState(() {
                        _content = value;
                      });
                    },
                  ),
                ),
                actionMethod(sizewidth: 40, sizeheight: 40, onPressed: () async {
                  String roomId  = (userc.uid + widget.user.uid);
                  await MessageResource().sendMessage(roomId,userc.uid , _sentController.text);
                  setState(() {
                    _sentController.text = "";
                  });
                }, iconData: (_content.isNotEmpty ?Icons.send : Icons.thumb_up), color:(_content.isNotEmpty ?Colors.blueAccent : Colors.blueAccent)),


              ],
            ),
          ),
      ),
    );
  }

  SizedBox actionMethod(
      {required double sizewidth,
        required double sizeheight,
        required IconData iconData,
        required VoidCallback onPressed,
        required Color color
      }){
    return SizedBox(
      width: sizewidth,
      height: sizeheight,
      child: IconButton(onPressed:onPressed, icon:  Icon(iconData, size: 25, color: color,)),
    );
  }
}



