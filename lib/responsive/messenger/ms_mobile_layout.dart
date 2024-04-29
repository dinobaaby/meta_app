import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:meta_app/utils/messenger/ms_utils.dart';



class MessageMobileLayout extends StatefulWidget {
  const MessageMobileLayout({super.key});

  @override
  State<MessageMobileLayout> createState() => _MessageMobileLayoutState();
}

class _MessageMobileLayoutState extends State<MessageMobileLayout> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTaped(int page){
    pageController.jumpToPage(page);
  }
  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: ms_background_color,

          body: PageView(
            children: ms_home_screen_items,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: onPageChanged,
          ),
          bottomNavigationBar: CupertinoTabBar(
            height: 45,
            backgroundColor: ms_background_color,
            items: [
              bottomNavigationBarItem(0, FontAwesomeIcons.comment),
              bottomNavigationBarItem(1, Icons.people),
              bottomNavigationBarItem(2, Icons.web_stories),
            ],
            onTap: navigationTaped,
          ),
        )
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(int page, IconData icon){
    return BottomNavigationBarItem(
      icon: Icon(
          icon,
          color: _page == page ? action_appbar_ms_color : Colors.grey,
          size: 25,
      ),

      backgroundColor: action_appbar_ms_color,

    );
  }
}
