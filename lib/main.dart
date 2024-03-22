import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/firebase_options.dart';
import 'package:meta_app/responsive/messenger/ms_mobile_layout.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';

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
      home: const MessageMobileLayout(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: action_appbar_ms_color
          )
        )
      ),
    );
  }
}
