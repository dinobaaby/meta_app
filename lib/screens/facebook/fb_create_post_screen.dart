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
                                      const SizedBox(width:5)
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
                                      const SizedBox(width:5)
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
                      offset: const Offset(0, 4),
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
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                            color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Photo"),
                          ]
                      )),
                      ListTile(title:
                        Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Tag People"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Feeling/activity"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Check in"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Video"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Background Color"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.camera, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Camera"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("GIF"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Life Event"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Music"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Tag Event"),
                          ]
                      )),
                      ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Your Avatar"),
                          ]
                      )),
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
