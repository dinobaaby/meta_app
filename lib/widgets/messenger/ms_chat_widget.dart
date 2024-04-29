import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/screens/messenger/ms_chat_screen.dart';
import 'package:meta_app/widgets/messenger/ms_avatar_widget.dart';

class MessengerChatWidget extends StatelessWidget {
  const MessengerChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessengerChatScreen())),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height:50,
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
          children: [
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/434163810_1151194212690675_8393077874314169787_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFcaq6mRwqmqKIui87tO0Vmgzkqmiop656DOSqaKinrnoUFbcpOaON2MvSrpoJKPZykmvRI1-zk9DBg48yLpccA&_nc_ohc=GRkr59DCx_4AX_EBgKw&_nc_ht=scontent.fhan5-8.fna&oh=00_AfAAjVZY7rVcdwZLqtL7l2F9BCtDKc8F4xJuRl_vj2T4lg&oe=660EE3FE"),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 1,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                          border: Border.all(color: Colors.black, width: 2)
                      ),
                    )
                )
              ],
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Text(
                        "Nguyen tho quan",
                        style: TextStyle(
                            color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    Text(
                        "Nguyen tho quan",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                    ),
      
                  ],
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/434651852_1616363115799888_8289186369376195356_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGpHzSkBkVic0OCPYO63UVD_-m4t_ekG9X_6bi396Qb1dd5Khx8vcJPIkynnT_YXJoj9gUJHXcm-Xm6f8rCq2So&_nc_ohc=GaUW8XFZTxwAX-ltYCD&_nc_ht=scontent.fhan15-2.fna&oh=00_AfDJg5UNPIvY_4nANtqyCG7-XPTtLt5qVxYH8mBnt8AIQA&oe=660EEA27"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )
          ],
        ),
      
      ),
    );
  }
}
