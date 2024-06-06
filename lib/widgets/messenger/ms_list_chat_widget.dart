// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:meta_app/resource/auth.resource.dart';
// import 'package:meta_app/screens/messenger/ms_chat_screen.dart';
// import 'package:meta_app/widgets/messenger/ms_chat_widget.dart';
//
// import '../../models/user.model.dart';
//
// class MessengerListChatWidget extends StatefulWidget {
//   const MessengerListChatWidget({super.key});
//
//   @override
//   State<MessengerListChatWidget> createState() => _MessengerListChatWidgetState();
// }
//
// class _MessengerListChatWidgetState extends State<MessengerListChatWidget> {
//   int _selectedIndex = 0;
//   List<String> _options = ["Home", 'Channel'];
//   late Future<List<UserModel>> _usersFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _usersFuture = AuthMethods().fetchUsersExceptCurrent();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: 10),
//             SizedBox(
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         _selectedIndex = 0; // Update current selection index when user taps
//                       });
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                       alignment: Alignment.center,
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: _selectedIndex == 0 ? Colors.blue : Colors.transparent,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         'Home',
//                         style: TextStyle(
//                             color: _selectedIndex == 0 ? Colors.white : Colors.grey),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         _selectedIndex = 1; // Update current selection index when user taps
//                       });
//                       print(_options[_selectedIndex]); // Print selected value
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                       alignment: Alignment.center,
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: _selectedIndex == 1 ? Colors.blue : Colors.transparent,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         'Channel',
//                         style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.grey),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             FutureBuilder<List<UserModel>>(
//               future: _usersFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }
//                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text('No users found'));
//                 }
//
//                 List<UserModel> users = snapshot.data!;
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     UserModel user = users[index];
//                     return MessengerChatWidget(user: user);
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta_app/resource/auth.resource.dart';
import 'package:meta_app/screens/messenger/ms_chat_room_screen.dart';
import 'package:meta_app/screens/messenger/ms_chat_screen.dart';
import 'package:meta_app/widgets/messenger/ms_chat_widget.dart';

import '../../models/room.model.dart';
import '../../models/user.model.dart';

class MessengerListChatWidget extends StatefulWidget {
  const MessengerListChatWidget({super.key});

  @override
  State<MessengerListChatWidget> createState() => _MessengerListChatWidgetState();
}

class _MessengerListChatWidgetState extends State<MessengerListChatWidget> {
  int _selectedIndex = 0;
  List<String> _options = ["Home", 'Channel'];
  late Future<List<UserModel>> _usersFuture;
  late Future<List<ChatRoom>> _chatRoomsFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = AuthMethods().fetchUsersExceptCurrent();
    _chatRoomsFuture = AuthMethods().fetchJoinedChatRooms();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0; // Update current selection index when user taps
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 30,
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0 ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            color: _selectedIndex == 0 ? Colors.white : Colors.grey),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1; // Update current selection index when user taps
                      });
                      print(_options[_selectedIndex]); // Print selected value
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 30,
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1 ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Channel',
                        style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _selectedIndex ==0
                ? FutureBuilder<List<UserModel>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No users found'));
                }

                List<UserModel> users = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    UserModel user = users[index];
                    return MessengerChatWidget(user: user);
                  },
                );
              },
            )
                : FutureBuilder<List<ChatRoom>>(
              future: _chatRoomsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No chat rooms found'));
                }

                List<ChatRoom> chatRooms = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: chatRooms.length,
                  itemBuilder: (context, index) {
                    ChatRoom chatRoom = chatRooms[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MsChatRoomScreen(roomId: chatRoom.roomId,))),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: NetworkImage(chatRoom.roomImage),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(chatRoom.roomName, style: TextStyle(color: Colors.white, fontSize: 16),),
                                  Text('${chatRoom.users.length} members', style: TextStyle(color: Colors.grey),)
                                ],
                              )
                            ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
