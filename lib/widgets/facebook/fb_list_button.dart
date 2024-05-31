import 'package:flutter/material.dart';

import '../../screens/auth/login_screen.dart';
import '../../services/firebase_service.dart';

class FB_List_Button extends StatelessWidget {
  final AuthService authService = AuthService();

  FB_List_Button({super.key});

  Future<void> _signOut(BuildContext context) async {
    await authService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            width: double.infinity,
            padding:const EdgeInsets.only(top:5 ) ,
            child:  const Column(
              children: [
                Divider(
                  color: Colors.black38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.help, color: Colors.black38, size: 30,),
                        SizedBox(width: 10,),
                        Text(
                          "Trợ giúp và hỗ trợ",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black38, size: 30,)
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: Container(
            width: double.infinity,
            padding:const EdgeInsets.only(top:5 ) ,
            child:  const Column(
              children: [
                Divider(
                  color: Colors.black38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.settings, color: Colors.black38, size: 30,),
                        SizedBox(width: 10,),
                        Text(
                          "Cài đặt & quyền riêng tư",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black38, size: 30,)
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: Container(
            width: double.infinity,
            padding:const EdgeInsets.only(top:5 ) ,
            child:  const Column(
              children: [
                Divider(
                  color: Colors.black38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu, color: Colors.black38, size: 30,),
                        SizedBox(width: 10,),
                        Text(
                          "Cũng từ Meta",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black38, size: 30,)
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: const Color(0xFFC2C2C2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
              onPressed: () => _signOut(context),
              child: const Text("Đăng xuất", style:
              TextStyle(color: Colors.black),)
          ),
        ),
      ],
    );
  }
}
