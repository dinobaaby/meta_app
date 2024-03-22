import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MessengerDrawerActionWidget extends StatelessWidget {
  final bool isChecked;
  const MessengerDrawerActionWidget({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(103, 103, 103, 1.0),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: InkWell(
                  onTap: (){},
                  child: Icon(FontAwesomeIcons.comment, color: Colors.white,size: 20,),
                ),
              ),
              Text("Đoạn chat", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),)


            ],
          ),
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(92, 167, 253, 1.0),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              "2",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),
            ),
          )
        ],
      ),
    );
  }
}
