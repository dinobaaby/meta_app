import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/models/user.model.dart';
import 'package:meta_app/screens/messenger/ms_chat_screen.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/user.provider.dart';

class MessengerSearchScreen extends StatefulWidget {
  const MessengerSearchScreen({super.key});

  @override
  State<MessengerSearchScreen> createState() => _MessengerSearchScreenState();
}

class _MessengerSearchScreenState extends State<MessengerSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot>? _searchResultsFuture;
  bool isShowUsers = false;
  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();

  }







  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 9,
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(48, 48, 48, 1.0),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: "search user",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                      labelStyle:  TextStyle(color: Colors.white),
                      suffixStyle: TextStyle(color: Colors.white),

                    ),
                    style: const TextStyle(color: Colors.white),


                    onFieldSubmitted: (String _) {
                      setState(() {
                        isShowUsers = true;
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: action_appbar_ms_color,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
          leading: null,
          backgroundColor: Colors.black,
        ),
        backgroundColor: ms_background_color,
        body: isShowUsers
            ? FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .where('username',
                isGreaterThanOrEqualTo: _searchController.text)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator
                          .of(context)
                          .push(MaterialPageRoute(builder: (context) => MessengerChatScreen( user: UserModel.fronSnap((snapshot.data! as dynamic).docs[index]),roomId: user.uid + ((snapshot.data! as dynamic).docs[index]['uid']),))),
                      child: ListTile(

                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              (snapshot.data! as dynamic).docs[index]
                              ['profilePictureUrl']),
                        ),
                        title: Text((snapshot.data! as dynamic).docs[index]
                        ['username'], style: const TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                    );
                  });
            })

            :  Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gợi ý", style: TextStyle(color: Color.fromRGBO(
                            206, 200, 200, 0.4)),),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/testImage.jpg'),
                            ),
                            SizedBox(width: 20,),
                            Text("Nguyễn Việt Hoàng", style: TextStyle(color: Colors.white, fontSize: 16),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/testImage.jpg'),
                            ),
                            SizedBox(width: 20,),
                            Text("Nguyễn Thế Huy Hoàng", style: TextStyle(color: Colors.white, fontSize: 16),)
                          ],
                        )
                      ],
                  ),
            )
      ),
    );
  }
}
