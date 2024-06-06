import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_layout/multi_image_layout.dart';
import 'package:readmore/readmore.dart';

class CommemtScreen extends StatefulWidget {
  const CommemtScreen({super.key});

  @override
  State<CommemtScreen> createState() => _CommemtScreenState();
}

class _CommemtScreenState extends State<CommemtScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
            ),
            Column(
              children: [
                Text('Nguyen Viet Hoang'),
                Row(
                  children: [
                    Text('2h -'),
                    Icon(Icons.public, size: 15,)
                  ],
                )
              ]
            )
          ]
        ) ,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz) ,
            onPressed: () {  },
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            // Text Content Show more and Show less
            const ReadMoreText(
              "Lorem ipsum dolor sit amet, consectetur",
              trimLines: 2,
              style:  TextStyle(fontSize: 12, color: Colors.black),
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              moreStyle:  TextStyle(fontSize: 11),
            ),
             const SizedBox(
              height: 10,
            ),

            // Image Layout Viewer
            MultiImageViewer(
              images: [
                ImageModel(imageUrl: "https://via.placeholder.com/350x150"),
                ImageModel(imageUrl: "https://via.placeholder.com/350x150"),
                ImageModel(imageUrl: "https://via.placeholder.com/350x150"),
                ImageModel(imageUrl: "https://via.placeholder.com/350x150"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Row Like Comment Share

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          onPressed: () {},
                        ),
                        const Text('Like')
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () {},
                        ),
                        const Text('Comment')
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {},
                        ),
                        const Text('Share')
                      ],
                    )
                  ],
                ),
                const Row(
                  children:[
                    Icon(Icons.thumb_up),
                    SizedBox(width: 5,),
                    Text("1.5K")
                  ]
                ),
                const Text("45 Share")
              ],
            ),
             const CommentCard()
          ],
        ),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       const CircleAvatar(
         backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
       ),
       Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
           color: const Color(0XFF808080ff),
         ),
         child: const Column(
           children: [
             Text('Nguyen Viet Hoang'),
             Text("Comments")
           ],
         ),
       ),
       const Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children:[
           Text("2h"),
           Text("Like"),
           Text("Reply")
         ]
       )
     ],
    );
  }
}
