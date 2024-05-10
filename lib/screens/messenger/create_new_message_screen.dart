import "package:flutter/material.dart";

class CreateNewMessageScreen extends StatelessWidget {
  const CreateNewMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text("New Message", style: TextStyle(color: Colors.white, fontSize: 20),),
          backgroundColor: Colors.black,
          centerTitle: false,
          iconTheme:const IconThemeData(
            color: Colors.white
          ),
        ),

        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
