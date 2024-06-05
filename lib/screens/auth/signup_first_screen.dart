import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/screens/auth/login_screen.dart';
import 'package:meta_app/screens/auth/sigup_final_screen.dart';


class SignupFirstScreen extends StatelessWidget {
  const SignupFirstScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body:  Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(51, 60, 63, 1.0),
                  Color.fromRGBO(24, 46, 61, 1.0),
                ]
              )

            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen())),
                    child: const Icon(Icons.arrow_back, color: Colors.white,),
                ),
                const SizedBox(height: 20,),
                const Text("Tham gia Facebook", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600,)),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/testImage.jpg"),
                      fit: BoxFit.cover

                    )
                  ),
                ),
                const Text("Hãy tạo tài khoản để kết nối với bạn bè, người thân và cộng đồng có chung sở thích.", style: TextStyle(color: Colors.white, fontSize: 14),),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpFinalScreen())),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 100, 223, 1.0),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    alignment: Alignment.center,
                    child: const Text("Bắt đầu", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),),
                  ),
                ),
                InkWell(
                  child: Container(

                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(40)
                    ),
                    alignment: Alignment.center,
                    child: const Text("Tôi có tài khoản rồi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
