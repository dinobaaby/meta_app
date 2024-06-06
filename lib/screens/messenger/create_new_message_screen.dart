import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import '../../models/user.model.dart';
import '../../resource/messenger/rooms.resource.dart';

class CreateNewMessageScreen extends StatefulWidget {
  const CreateNewMessageScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewMessageScreen> createState() => _CreateNewMessageScreenState();
}

class _CreateNewMessageScreenState extends State<CreateNewMessageScreen> {
  TextEditingController _roomNameController = TextEditingController();
  TextEditingController _newMemberController = TextEditingController();
  Uint8List? _image;
  List<String> _members = [];
  List<UserModel> _searchResults = [];
  final RoomResource _roomResource = RoomResource();

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      setState(() {
        _image = bytes;
      });
    }
  }

  void _addMember(String email) {
    if (!_members.contains(email)) {
      setState(() {
        _members.add(email);
      });
    }
  }

  Future<void> _searchUser(String email) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    setState(() {
      _searchResults = result.docs.map((doc) => UserModel.fronSnap(doc)).toList();
    });
  }

  Future<void> _createChatRoom() async {
    String roomName = _roomNameController.text.trim();
    if (roomName.isEmpty || _image == null || _members.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and add at least one member')),
      );
      return;
    }

    String roomImageUrl = await _uploadImageToStorage(_image!);

    await _roomResource.createChatRoom(roomName, roomImageUrl, _members);

    Navigator.pop(context);
  }

  Future<String> _uploadImageToStorage(Uint8List image) async {
    String fileName = Uuid().v4();
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('chatRoomImages/$fileName');
    UploadTask uploadTask = storageReference.putData(image);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "New Message",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Colors.black,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _roomNameController,
                decoration: InputDecoration(
                  labelText: 'Room Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: _pickImage,
                child: _image == null
                    ? Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Icon(Icons.add_a_photo, color: Colors.white),
                )
                    : Image.memory(
                  _image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _newMemberController,
                decoration: InputDecoration(
                  labelText: 'Search by Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                onSubmitted: (email) => _searchUser(email),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _searchUser(_newMemberController.text.trim()),
                child: Text('Search'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final user = _searchResults[index];
                    return ListTile(
                      title: Text(
                        user.email,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.add, color: Colors.green),
                        onPressed: () => _addMember(user.email),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _members.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _members[index],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _members.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _createChatRoom,
                  child: Text('Create Chat Room'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
