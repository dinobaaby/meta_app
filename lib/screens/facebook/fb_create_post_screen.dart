import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/facebook/fb_colors.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post',
            style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600,
                color: title_fb_color)
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(FontAwesomeIcons.xmark)),
        actions: [
          TextButton(onPressed: (){},
              child: const Text("Next",
                style: TextStyle(fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: title_fb_color),
              )
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child:  Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('AH'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 12, color: button_bottombar_not_selected),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Row(
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: const Color.fromRGBO(25, 128, 241, 1.0),
                                          backgroundColor: background_button_color,
                                          shape:  RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                          ),
                                        ),
                                        onPressed: (){},
                                        child: const Row(
                                          children: [
                                            Icon(Icons.public, size: 20,),
                                            SizedBox(width: 5),
                                            Text("Public",
                                              style: TextStyle(
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:5)
                                    ]
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Row(
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: const Color.fromRGBO(25, 128, 241, 1.0),
                                          backgroundColor: background_button_color,
                                          shape:  RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                          ),
                                        ),
                                        onPressed: (){},
                                        child: const Row(
                                          children: [
                                            Icon(Icons.add, size: 20,),
                                            SizedBox(width: 5),
                                            Text("Album",
                                              style: TextStyle(
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:5)
                                    ]
                                ),
                              ),
                            ],

                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                const SizedBox(
                  height:400,
                  child: TextField(
                    cursorColor: Colors.purple,
                    maxLines: 100,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What's your mind?",
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            builder: (BuildContext context, scrollController) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 4,
                          width: 40,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                    SliverList.list(children: const [
                      ListTile(title: Text('Photo')),
                      ListTile(title: Text('Tag People')),
                      ListTile(title: Text('Feeling/activity')),
                      ListTile(title: Text('Check in')),
                      ListTile(title: Text('Live Video')),
                      ListTile(title: Text('Background Color')),
                      ListTile(title: Text('Camera')),
                      ListTile(title: Text('GIF')),
                      ListTile(title: Text('Life Event')),
                      ListTile(title: Text('Music')),
                      ListTile(title: Text('Tag Event')),
                      ListTile(title: Text('Your Avatar')),
                    ])
                  ],
                ),
              );
            },
          ),
        ],
      )
    );
  }
}
