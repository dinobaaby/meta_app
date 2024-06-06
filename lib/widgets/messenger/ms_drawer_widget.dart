import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/models/user.model.dart';
import 'package:meta_app/screens/facebook/fb_profile_screen.dart';
import 'package:meta_app/screens/messenger/ms_user_setting_screen.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/ms_community_widget.dart';
import 'package:meta_app/widgets/messenger/ms_drawer_action_widget.dart';
import 'package:provider/provider.dart';

import '../../models/messenger/communicate.model.dart';
import '../../providers/user.provider.dart';

class MessengerDrawerWidget extends StatefulWidget {
  const MessengerDrawerWidget({super.key});

  @override
  State<MessengerDrawerWidget> createState() => _MessengerDrawerWidgetState();
}

class _MessengerDrawerWidgetState extends State<MessengerDrawerWidget> {


  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return Drawer(
      width: MediaQuery.of(context).size.width*0.85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero
        )
      ),
      backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(user.profilePictureUrl),fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(user.username, style: TextStyle(color: title_ms_color, fontSize: 15, fontWeight: FontWeight.w600),)
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MsUserSettingScreen()));
                    },
                    icon: Icon(Icons.settings, color: Colors.white,)
                )


              ],
            ),
             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     const SizedBox(height: 15,),
                     const MessengerDrawerActionWidget(isChecked: true,title: "Chats", iconData: FontAwesomeIcons.comment,countNotifications: 5,),
                     const MessengerDrawerActionWidget(isChecked: false,title: "Marketplace", iconData: Icons.shopping_bag,countNotifications: 2,),
                     const MessengerDrawerActionWidget(isChecked: false, title: "Message requests",iconData: Icons.chat,countNotifications: 1,),
                     const MessengerDrawerActionWidget(isChecked: false,title: "Archive",iconData: Icons.storefront_rounded,countNotifications: 0,),
                     const SizedBox(height:10),
                     const Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Cộng đồng", style: TextStyle(fontSize: 11, color: Colors.grey ),),
                         Text("Chỉnh sửa", style: TextStyle(color: action_appbar_ms_color, fontSize: 11),)
                       ],
                     ),
                     const SizedBox(height: 10,),
                     MessengerCommunityWidget(communicate: Communicate(uid: "", name: "10 thần tài", bio: "", managerID: "", members: ["a", "b"], photoUrl: "assets/images/meobulon.jpg"),),
                     InkWell(
                       onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FacebookProfileScreen())),
                       child: Container(child: Text("Profile", style: TextStyle(color: Colors.white),),),
                     )


                   ],
                 ),
               ),
             )
          ],
        ),
      ),
    );
  }
}
