import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/firebase_options.dart';
import 'package:meta_app/providers/user.provider.dart';
import 'package:meta_app/responsive/messenger/ms_mobile_layout.dart';
import 'package:meta_app/screens/auth/login_screen.dart';
import 'package:meta_app/screens/messenger/ms_home_screen.dart';
import 'package:meta_app/screens/messenger/ms_people_screen.dart';
import 'package:meta_app/screens/messenger/ms_search_screen.dart';
import 'package:meta_app/screens/messenger/ms_stories_screen.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';
import 'package:provider/provider.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fixing the constructor

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp( // Wrapping with MaterialApp
        home: const MessageMobileLayout(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: action_appbar_ms_color
            )
          )
        ),
        initialRoute: "/login",
        routes: {
          "": (_) => const MessengerHomeScreen(),
          "/search": (_) => const MessengerSearchScreen(),
          "/people" : (_) => const MessengerPeopleScreen(),
          "/stories" : (_) => const MessengerStoriesScreen(),
          "/login": (_) => const LoginScreen()
        },
      ),
    );
  }
}
