import 'package:flutter/material.dart';

class FBButtonCameraActionWidget extends StatefulWidget {
  final Function action;

  const FBButtonCameraActionWidget({super.key, required this.action});

  @override
  State<FBButtonCameraActionWidget> createState() =>
      _FBButtonCameraActionWidgetState();
}

class _FBButtonCameraActionWidgetState
    extends State<FBButtonCameraActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const ShapeDecoration(
          shape: CircleBorder(), color: Color.fromRGBO(228, 229, 237, 1)),
      child: IconButton(
        onPressed: widget.action(),
        icon: const Icon(
          Icons.camera_alt,
          color: Colors.black,
        ),
        color: Colors.black,
      ),
    );
  }
}
