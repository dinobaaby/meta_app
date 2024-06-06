import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  // final snap;
  const CommentCard({super.key
      // , required this.snap
      });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                // widget.snap['profilePic']
                "https://icdn.24h.com.vn/upload/3-2023/images/2023-08-15/Ngam-than-hinh-phu-huynh-cua-gai-xinh-co-doi-tu-gay-tranh-cai-3-1692073627-292-width650height780.jpeg"),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      // text: widget.snap['name'],
                      text: "some text",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        // text: ' ${widget.snap['text']}',
                        text: "some text"),
                  ])),
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      // DateFormat.yMMMd()
                      //     .format(widget.snap['datePublished'].toDate()),
                      "22/12/2024"
                      ,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.favorite,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
