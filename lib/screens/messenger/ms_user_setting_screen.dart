import 'package:flutter/material.dart';
import 'package:meta_app/screens/auth/login_screen.dart';

import '../../resource/auth.resource.dart';

class MsUserSettingScreen extends StatefulWidget {
  const MsUserSettingScreen({super.key});

  @override
  State<MsUserSettingScreen> createState() => _MsUserSettingScreenState();
}

class _MsUserSettingScreenState extends State<MsUserSettingScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                    AuthMethods().signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
              child: Container(
                width: 100,
                height: 50,
                color: Colors.black,
                child: Text("Logout", style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
