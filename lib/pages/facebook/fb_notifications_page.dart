import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/facebook/fb_colors.dart';
import '../../widgets/facebook/fb_notifications_box.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: title_fb_color),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return SizedBox(
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(left: 10,),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.envelope,
                                  ),
                                  onPressed: () {}
                                ),
                                SizedBox(width: 8,),
                                Text(
                                    'Đánh dấu tất cả là đã đọc',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        )
                      );
                    }
                );
              },
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.search))
          ],
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              NotificationsBox(),
              NotificationsBox(),
              NotificationsBox(),
              NotificationsBox(),
            ],
          ),
        )
    );
  }
}


