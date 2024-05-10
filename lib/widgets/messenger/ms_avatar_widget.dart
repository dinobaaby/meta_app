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
                  image: AssetImage("assets/images/testImage.jpg"),fit: BoxFit.cover
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