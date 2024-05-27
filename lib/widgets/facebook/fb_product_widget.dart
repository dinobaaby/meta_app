import 'package:flutter/material.dart';

class FBProductWidget extends StatefulWidget {
  final String image;
  final String title;

  const FBProductWidget({super.key, required this.image, required this.title});

  @override
  State<FBProductWidget> createState() => _FBProductWidgetState();
}

class _FBProductWidgetState extends State<FBProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: NetworkImage(widget.image)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
