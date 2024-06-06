import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/firebase_options.dart';
import 'package:meta_app/screens/auth/login_screen.dart';
import 'package:meta_app/screens/facebook/fb_comment_screen.dart';
import 'package:meta_app/screens/facebook/fb_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // return snapshot.data != null ? HomeScreen() : LoginScreen();
              return CommentScreen();
            }
          }
        },
      ),
    );
  }
}