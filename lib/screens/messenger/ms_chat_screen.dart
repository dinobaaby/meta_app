import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/ms_list_content_chat_widget.dart';


class MessengerChatScreen extends StatefulWidget {
  const MessengerChatScreen({super.key});

  @override
  State<MessengerChatScreen> createState() => _MessengerChatScreenState();
}

class _MessengerChatScreenState extends State<MessengerChatScreen> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _sentController = TextEditingController();
  String _content = "";
  List<String> _messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;

      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _sentController.dispose();
    _focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ms_background_color,
            title: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/434163810_1151194212690675_8393077874314169787_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFcaq6mRwqmqKIui87tO0Vmgzkqmiop656DOSqaKinrnoUFbcpOaON2MvSrpoJKPZykmvRI1-zk9DBg48yLpccA&_nc_ohc=GRkr59DCx_4AX_EBgKw&_nc_ht=scontent.fhan5-8.fna&oh=00_AfAAjVZY7rVcdwZLqtL7l2F9BCtDKc8F4xJuRl_vj2T4lg&oe=660EE3FE"),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
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
                  child: const Column(
                    children: [
                      Text("Dino dev", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("Active now", style: TextStyle(color: Colors.grey,  fontSize: 12),),
                    ],
                  ),
                )
              ],
            ),
            actions:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.phone, color: Colors.purple,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.video_camera_back, color: Colors.purple,))
            ],
          ),
          backgroundColor: ms_background_color,
          body: MessengerListContentChatWidget(),
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
                            actionMethod(sizewidth: 40, sizeheight: 40, onPressed: (){}, iconData: Icons.image, color:action_appbar_ms_color),
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
                actionMethod(sizewidth: 40, sizeheight: 40, onPressed: (){}, iconData: (_content.isNotEmpty ?Icons.send : Icons.favorite), color:(_content.isNotEmpty ?Colors.blueAccent : Colors.red)),


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



