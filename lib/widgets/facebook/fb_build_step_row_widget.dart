import 'package:flutter/material.dart';

Widget BuildStepRow({
  required String imagePath,
  required String title,
  required String subtitle,
  double progressValue = -1,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
    child: Row(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(imagePath),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12),
              ),
              if (progressValue != -1)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: const Color.fromRGBO(201, 203, 209, 1.0),
                    valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.blue),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
        )
      ],
    ),
  );
}
