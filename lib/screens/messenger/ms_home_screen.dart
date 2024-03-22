import 'package:flutter/material.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/widgets/messenger/ms_drawer_widget.dart';

class MessengerHomeScreen extends StatefulWidget {
  const MessengerHomeScreen({super.key});

  @override
  State<MessengerHomeScreen> createState() => _MessengerHomeScreenState();
}

class _MessengerHomeScreenState extends State<MessengerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ms_background_color,
          appBar: AppBar(
            backgroundColor: ms_background_color,
            title: Text("Chats", style: TextStyle(color: title_ms_color, fontSize: 20, fontWeight: FontWeight.bold),),
            centerTitle: true,
            actions: [

            ],
          ),


          drawer: MessengerDrawerWidget(),


        ),

    );
  }
}
