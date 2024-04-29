import 'package:flutter/material.dart';

class MessengerAvatarWidget extends StatelessWidget {
  final String avatarUrl;
  final String active;
  final int height;
  final int width;

  const MessengerAvatarWidget({
    super.key,
    required this.active,
    required this.avatarUrl,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    double borderSize = double.parse((height / 2).toString());
    return  Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://scontent.fhan14-1.fna.fbcdn.net/v/t39.30808-6/434363000_393052523667800_4778544966026628033_n.jpg?stp=cp6_dst-jpg&_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEJ5t4lBtbO4GKAuiOY1msbirYn1x9l-3GKtifXH2X7cfDAXfHwjidHK7Inz2FESB7ocUKOXNWGo8WHZqAZb3i0&_nc_ohc=XAenC9Z6zx8AX-HSFIa&_nc_ht=scontent.fhan14-1.fna&oh=00_AfBIyapvz7D2UtYkLKQ51cf5gEWSUFp09am2nKz9_RzlJg&oe=6608044A"),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
        ),
        Positioned(
            bottom: 2,
            right: 6,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.black, width: 1)
              ),
            )
        )
      ],
    );
  }
}