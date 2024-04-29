

import 'package:flutter/material.dart';


class MessengerCommunityWidget extends StatelessWidget {
  const MessengerCommunityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.zero,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage('https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/434163810_1151194212690675_8393077874314169787_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFcaq6mRwqmqKIui87tO0Vmgzkqmiop656DOSqaKinrnoUFbcpOaON2MvSrpoJKPZykmvRI1-zk9DBg48yLpccA&_nc_ohc=GRkr59DCx_4AX_EBgKw&_nc_ht=scontent.fhan5-8.fna&oh=00_AfAAjVZY7rVcdwZLqtL7l2F9BCtDKc8F4xJuRl_vj2T4lg&oe=660EE3FE'),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10)
              ),

            ),
          ),
          Flexible(flex: 4,child: Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Column(

              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Hi anh em lai la hoang thich blu day",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,


                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text("5790 online", style: TextStyle(fontSize: 12, color: Colors.grey),)
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
