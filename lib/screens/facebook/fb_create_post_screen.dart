
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/users.model.dart';
import '../../services/firebase_service.dart';
import '../../utils/facebook/fb_colors.dart';

class CreatePostScreen extends StatefulWidget {
  final User user;
   CreatePostScreen({super.key, required this.user});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _contentController = TextEditingController();
  List<File> _images = [];
  final AuthService _authService = AuthService();

  Future<void> _pickImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    setState(() {
      _images = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
    });
    }

  Future<void> _createPost() async {
    if (_contentController.text.isNotEmpty || _images.isNotEmpty) {
      try {
        List<String> imageUrls = await _uploadImages();
        await _authService.createPost(
          userId: widget.user.uid,
          content: _contentController.text,
          imageUrls: imageUrls,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post Created Successfully')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add content or images')),
      );
    }
  }

  Future<List<String>> _uploadImages() async {
    List<String> imageUrls = [];
    for (File image in _images) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference = FirebaseStorage.instance.ref().child('posts/$fileName');
      UploadTask uploadTask = storageReference.putFile(image as File);
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }
    return imageUrls;
  }


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
          TextButton(onPressed: _createPost,
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
                     CircleAvatar(
                      child: CachedNetworkImage(
                        imageUrl: widget.user.avatarUrl ,
                      ),
                      ) ,

                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            widget.user.name,
                            style: const TextStyle(
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
                                          backgroundColor: button_background_color,
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
                                          backgroundColor: button_background_color,
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
                 SizedBox(
                  height:400,
                  child: TextField(
                    controller: _contentController,
                    cursorColor: Colors.purple,
                    maxLines: 100,
                    decoration: const InputDecoration(
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
                    SliverList.list(children: [
                      ListTile(title:
                      const Row(
                          children:[
                            Icon(FontAwesomeIcons.image, size: 22,
                            color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("Photo"),
                          ]
                      )
                          ,onTap: _pickImages,
                      ),
                      const ListTile(title:
                        Row(
                          children:[
                            Icon(FontAwesomeIcons.peopleRobbery, size: 22,
                                color: Colors.blue
                            ),
                            SizedBox(width: 10),
                            Text("Tag People"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.faceDizzy, size: 22,
                                color: Colors.yellow
                            ),
                            SizedBox(width: 10),
                            Text("Feeling/activity"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.locationDot, size: 22,
                                color: Colors.redAccent
                            ),
                            SizedBox(width: 10),
                            Text("Check in"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.video, size: 22,
                                color: Colors.red
                            ),
                            SizedBox(width: 10),
                            Text("Video"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.font, size: 22,
                                color: Colors.lightBlue
                            ),
                            SizedBox(width: 10),
                            Text("Background Color"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.camera, size: 22,
                                color: Colors.blueAccent
                            ),
                            SizedBox(width: 10),
                            Text("Camera"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.gift, size: 22,
                                color: Colors.green
                            ),
                            SizedBox(width: 10),
                            Text("GIF"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.calendar, size: 22,
                                color: Colors.blueAccent
                            ),
                            SizedBox(width: 10),
                            Text("Life Event"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.music, size: 22,
                                color: Colors.orange
                            ),
                            SizedBox(width: 10),
                            Text("Music"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.calendar, size: 22,
                                color: Colors.redAccent
                            ),
                            SizedBox(width: 10),
                            Text("Tag Event"),
                          ]
                      )),
                      const ListTile(title:
                      Row(
                          children:[
                            Icon(FontAwesomeIcons.user, size: 22,
                                color: Colors.red
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
