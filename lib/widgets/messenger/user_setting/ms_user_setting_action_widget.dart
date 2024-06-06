import 'package:flutter/material.dart';

class MsUsSettingActionWidget extends StatefulWidget {
  const MsUsSettingActionWidget({super.key});

  @override
  State<MsUsSettingActionWidget> createState() => _MsUsSettingActionWidgetState();
}

class _MsUsSettingActionWidgetState extends State<MsUsSettingActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,

              )
            ],
          )
        ],
      ),
    );
  }
}
