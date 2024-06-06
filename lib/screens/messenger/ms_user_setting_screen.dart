import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_app/models/user.model.dart';
import 'package:meta_app/providers/user.provider.dart';
import 'package:meta_app/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';

import '../../resource/auth.resource.dart';

class MsUserSettingScreen extends StatefulWidget {
  const MsUserSettingScreen({super.key});

  @override
  State<MsUserSettingScreen> createState() => _MsUserSettingScreenState();
}

class _MsUserSettingScreenState extends State<MsUserSettingScreen> {
  @override
  Widget build(BuildContext context) {
    double avatarSize = MediaQuery.of(context).size.width*0.33;
    final UserModel user = Provider.of<UserProvider>(context).getUser;

      InkWell userAction(Color iconColor, IconData icon, String title,String subtitle, int countNoti, Function fc){
      return InkWell(
        onTap: () => fc,
        child: Container(
          margin:const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin:const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Icon(icon, color: Colors.white,),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.white, fontSize: 15),),
                      subtitle.isNotEmpty ? Text(subtitle, style:const TextStyle(color: Colors.grey, fontSize: 10),) : Container()
                    ],
                  )
                ],
              ),
              countNoti > 0 ? Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('$countNoti', style:const TextStyle(color: Colors.white, fontSize: 12),),
              ) : Container()
            ],
          ),
        ),
      );
    }
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title:const Text("Me", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme:const IconThemeData(
          color: Colors.white
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration:const BoxDecoration(
            color: Colors.black
          ),
          child: Column(
            children: [
              Stack(
                  children: [
                    Container(
                    width: avatarSize,
                    height: avatarSize,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(user.profilePictureUrl),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(avatarSize/2)
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5
                            )
                          ),
                          child:const Icon(Icons.camera_alt, color: Colors.white,)
                      )
                  ),
        
                ]
              ),
              Container(
                margin:const EdgeInsets.only(top: 10),
                child: Text(user.username, style: const TextStyle(color: Colors.white, fontSize: 25),),
              ),
              Container(
                margin:const EdgeInsets.symmetric(vertical: 0),
                child: const Text('write a note', style:  TextStyle(color: Colors.blue, fontSize: 15),),
              ),
              userAction(const Color.fromRGBO(1, 85, 239, 1.0), Icons.home, "Xem cảnh báo bảo mật","", 2, (){}),
              userAction(const Color.fromRGBO(145, 146, 150, 1.0), Icons.dark_mode, "Chế độ tối","Hệ thống", 0,(){}),
              userAction(const Color.fromRGBO(45, 239, 12, 1.0), Icons.mark_chat_unread, "Trạng thái hoạt động","Đang bật", 0,(){}),
              userAction(const Color.fromRGBO(246, 21, 21, 1.0), Icons.drive_file_rename_outline, "Tên người dùng",user.username, 0,(){}),
              Row(
                children: [
                  Container(
        
                    margin:const EdgeInsets.symmetric(vertical: 2),
                    child: const Text('Dành cho gia đình', style:  TextStyle(color: Colors.grey, fontSize: 14),),
                  ),
                ],
              ),
              userAction(const Color.fromRGBO(1, 85, 239, 1.0), Icons.people, "Giám sát","", 0,(){}),
              Row(
                children: [
                  Container(
        
                    margin:const EdgeInsets.symmetric(vertical: 2),
                    child: const Text('Dịch vụ', style:  TextStyle(color: Colors.grey, fontSize: 14),),
                  ),
                ],
              ),
              userAction(const Color.fromRGBO(8, 255, 41, 1.0), Icons.card_travel, "Đơn đặt hàng","", 0,(){}),
              userAction(const Color.fromRGBO(33, 32, 32, 1.0), Icons.payment, "Thanh toán","", 0,(){}),
              Row(
                children: [
                  Container(

                    margin:const EdgeInsets.symmetric(vertical: 2),
                    child: const Text('Tùy chỉnh', style:  TextStyle(color: Colors.grey, fontSize: 14),),
                  ),
                ],
              ),
              userAction(const Color.fromRGBO(151, 26, 255, 1.0), Icons.event_available, "Avatar","", 2, (){}),
              userAction(const Color.fromRGBO(3, 146, 150, 1.0), Icons.home, "Quyền riêng tư và an toàn","", 0,(){}),
              userAction(const Color.fromRGBO(4, 114, 222, 1.0), Icons.mark_chat_unread, "Trạng thái hoạt động","", 0,(){}),
              userAction(const Color.fromRGBO(79, 14, 245, 1.0), Icons.drive_file_rename_outline, "Tên người dùng","", 0,(){}),
              InkWell(
                onTap: (){
                      AuthMethods().signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.black,
                  child: Text("Logout", style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    ));


  }
}
