import 'package:flutter/material.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

final List<FB_ShortcutWidget> shortcuts = [

];

class FB_ShortcutWidget extends StatelessWidget {
  const FB_ShortcutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:<Widget>[
          FB_Shortcut_Icon(),
          FB_Shortcut_Icon(),
          FB_Shortcut_Icon(),
          FB_Shortcut_Icon(),
          FB_Shortcut_Icon()
        ],
      ),
    ) ;
  }
}

class FB_Shortcut_Icon extends StatelessWidget {
  const FB_Shortcut_Icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                  //Change Background => Image !!!!
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child:Container(
                      width: 17,
                      height: 17,
                      decoration: const BoxDecoration(
                        shape:BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Icon(Icons.groups, color: Colors.white, size:15),
                    ),
                  ),
                ),
              )
            ],
          ),
          Text("Name")
        ],
      ),
    );
  }
}
