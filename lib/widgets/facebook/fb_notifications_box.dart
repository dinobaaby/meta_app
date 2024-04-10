import 'package:flutter/material.dart';

import '../../utils/facebook/fb_colors.dart';

class NotificationsBox extends StatelessWidget {
  const NotificationsBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Mới',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Notification_Card(),
          Notification_Card(),
          Notification_Card(),
          Notification_Card(),

        ]);
  }
}

class Notification_Card extends StatelessWidget {
  const Notification_Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left:15, bottom: 13),
          child: Row(
            children: [
              const CircleAvatar(
                child: Text("VH"),
                maxRadius:35,
              ),
              const SizedBox(width: 8.0),
              Container(
                constraints: const BoxConstraints(
                    maxWidth: 300
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bạn có 100 thông báo kểm duyệt trong nhóm NOX AOV "
                          "GROUP",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18,
                          color: title_fb_color),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      "10 phút ",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}