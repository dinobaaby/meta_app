import 'package:flutter/material.dart';

class MessengerStoriesScreen extends StatefulWidget {
  const MessengerStoriesScreen({super.key});

  @override
  State<MessengerStoriesScreen> createState() => _MessengerPeopleScreenState();
}

class _MessengerPeopleScreenState extends State<MessengerStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Stories"),
    );
  }
}
