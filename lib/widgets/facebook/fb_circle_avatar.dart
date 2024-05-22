import 'dart:ffi';

import 'package:flutter/material.dart';

class FBCircleAvatar extends StatefulWidget {
  final double size;


  const FBCircleAvatar(this.size, {super.key});

  @override
  State<FBCircleAvatar> createState() => _FBCircleAvatarState();
}

class _FBCircleAvatarState extends State<FBCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.size,
        decoration: const ShapeDecoration(
            shape: CircleBorder(),
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.vietnamworks.com/hrinsider/wp-content/uploads/2023/12/anh-den-ngau.jpeg"))));
  }
}
