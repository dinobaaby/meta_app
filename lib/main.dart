import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/firebase_options.dart';
import 'package:meta_app/screens/facebook/fb_home_screen.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

