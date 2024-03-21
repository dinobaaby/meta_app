import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fixing the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Wrapping with MaterialApp
      home: Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
