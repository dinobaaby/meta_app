import 'package:flutter/material.dart';

Widget InfoCardWidget(
    {required String title,
    required String value,
    required int increase,
    required String time}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    width: 200,
    height: 150,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(width: 5,),
            Text(
              "+$increase%",
              style:
                  TextStyle(color: increase == 0 ? Colors.grey : Colors.green, fontSize: 11),
            )
          ],
        ),
        Text(
          time,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        )
      ],
    ),
  );
}
