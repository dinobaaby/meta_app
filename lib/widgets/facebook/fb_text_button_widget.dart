import 'package:flutter/material.dart';
import 'package:meta_app/utils/facebook/fb_colors.dart';

List<FBTextButtonWidget> listButton = [
  FBTextButtonWidget(() {}, Icons.thumb_up_alt_outlined, "Like"),
  FBTextButtonWidget(() {}, Icons.mode_comment_outlined, "Comment"),
  FBTextButtonWidget(() {}, Icons.message_outlined, "Sent"),
  FBTextButtonWidget(() {}, Icons.ios_share_outlined, "Share")
];

class FBTextButtonWidget extends StatefulWidget {
  final void Function() action;
  final IconData icon;
  final String text;

  const FBTextButtonWidget(this.action, this.icon, this.text, {super.key});

  @override
  State<FBTextButtonWidget> createState() => _FBTextButtonWidgetState();
}

class _FBTextButtonWidgetState extends State<FBTextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {setState(() {
          widget.action;
        });},
        style: TextButton.styleFrom(
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero)
        ),
        child: Row(
          children: [
            Icon(
              widget.icon as IconData?,
              size: 20,
              color: button_bottombar_not_selected,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(widget.text,
                style: const TextStyle(
                  fontSize: 12,
                  color: button_bottombar_not_selected,
                ))
          ],
        ));
  }
}
