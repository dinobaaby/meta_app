import "dart:ui";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/widgets.dart";
import "package:meta_app/widgets/messenger/chat/ms_chat_setting_action_widget.dart";


class MsSettingChatScreen extends StatefulWidget {
  const MsSettingChatScreen({super.key});

  @override
  State<MsSettingChatScreen> createState() => _MsSettingChatScreenState();
}

class _MsSettingChatScreenState extends State<MsSettingChatScreen> {


  handleShowTopic(){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: MediaQuery.of(context).size.height*0.9,
        color: const Color.fromRGBO(56, 50, 50, 1.0),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(),
        ),

      );
    });
  }

  final List<Map<String, dynamic>> msListItemSettingOptions = [
    {
      'icon': Icons.album_sharp,
      'label': 'Chủ đề',
      'color': const Color.fromRGBO(255, 255, 255, 1.0),
      'fc': (){

      }
    },
    {
      'icon': Icons.thumb_up,
      'label': 'Cảm xúc nhanh',
      'color': const Color.fromRGBO(10, 148, 208, 1.0),
      'fc': () {
        // Define the action for this setting

      }
    },
    {
      'icon': Icons.text_rotation_none,
      'label': 'Biệt danh',
      'color': const Color.fromRGBO(255, 255, 255, 1.0),
      'fc': () {
        // Define the action for this setting
        print('Trang cá nhân tapped');
      }
    },
    {
      'icon': Icons.edit,
      'label': 'Hiệu ứng từ ngữ',
      'color': const Color.fromRGBO(255, 255, 255, 1.0),
      'fc': () {
        // Define the action for this setting
        print('Tắt thông báo tapped');
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    double avatarWidth = MediaQuery.of(context).size.width*0.25;
    double avatarHeight = MediaQuery.of(context).size.width*0.25;
    double avatarBorderRadius = MediaQuery.of(context).size.width*0.25/2;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_sharp))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:const BoxDecoration(
          color: Colors.black
        ),
        child: SingleChildScrollView(

          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin:const EdgeInsets.only(top: 20),
                    width: avatarWidth,
                    height: avatarHeight,
                    decoration:  BoxDecoration(
                      image:const DecorationImage(
                        image: AssetImage("assets/images/testImage.jpg"),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(avatarBorderRadius)
                    ),
                  ),
                  Positioned(
                    bottom: avatarWidth/4/4,
                    right: avatarWidth/4/4,
                    child: Container(
                      width: avatarWidth/5,
                      height: avatarWidth/5,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(avatarBorderRadius/5),
                        border: Border.all(
                          color: Colors.black,
                          width: 3
                        )
                      ),
                    ),
                  )

                ],
              ),
              const SizedBox(height: 10,),
              const Text("Nguyễn Việt Hoàng", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),),
              const SizedBox(height: 20,),
              listMsSettingActionWidget(listItemSettingActionWidget, context),
              msListSettingOptionsThemeWidget(msListItemSettingOptions, context),
            ],
          ),
        ),

      ),
    ));
  }
}
