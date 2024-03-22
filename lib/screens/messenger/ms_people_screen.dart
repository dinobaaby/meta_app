import 'package:flutter/material.dart';

class MessengerPeopleScreen extends StatefulWidget {
  const MessengerPeopleScreen({super.key});

  @override
  State<MessengerPeopleScreen> createState() => _MessengerPeopleScreenState();
}

class _MessengerPeopleScreenState extends State<MessengerPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("People"),
    );
  }
}
