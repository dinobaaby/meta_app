import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/screens/auth/login_screen.dart';
import 'package:meta_app/utils/messenger/ms_colors.dart';


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
                const Text("Tham gia Facebook", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600,)),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage("https://scontent.fhan4-3.fna.fbcdn.net/v/t39.30808-6/440095592_1166400668011088_5256529095230784656_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHNT0IQ5o86UjMtEid2gP5i9Oq2pkNgTKf06ramQ2BMp75vEyMdgJHwiVz4gYrLZ-ubKZ9Th_zgyMKBSUpp63tp&_nc_ohc=fw-sAicSw8kAb48Z9G0&_nc_oc=AdgoGEL-D5jKYYgugPko_u6cvtdkoepsDIRS9C8xfUHTdarkWfVSvQIZ-Wc7tc4_hb0&_nc_ht=scontent.fhan4-3.fna&oh=00_AfDNhUXa1huESm8ZT5chHqHA4ITCpR4iG0lvfILfD3YxUQ&oe=663577D0"),
                      fit: BoxFit.cover

                    )
                  ),
                ),
                const Text("Hãy tạo tài khoản để kết nối với bạn bè, người thân và cộng đồng có chung sở thích.", style: TextStyle(color: Colors.white, fontSize: 15),),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 100, 223, 1.0),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    alignment: Alignment.center,
                    child: const Text("Bắt đầu", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),),
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
                    child: const Text("Tôi có tài khoản rồi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
