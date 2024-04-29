import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MessengerDrawerActionWidget extends StatelessWidget {
  final bool isChecked;
  final String title;
  final IconData iconData;
  final int countNotifications;
  const MessengerDrawerActionWidget({super.key,
    required this.isChecked,
    required this.title,
    required this.iconData,
    required this.countNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: this.isChecked ? const Color.fromRGBO(68, 68, 68, 1.0) : const Color.fromRGBO(38, 38, 38, 0.1) ,
        borderRadius: BorderRadius.circular(10)
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(103, 103, 103, 1.0),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: InkWell(
                  onTap: (){},
                  child: Icon(iconData, color: Colors.white,size: 20,),
                ),
              ),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),)
            ],
          ),
          (
              countNotifications > 0 ?
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(92, 167, 253, 1.0),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  "${countNotifications.toString()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12
                  ),
                ),
              )
              :
                  Container()
          )

        ],
      ),
    );
  }
}
