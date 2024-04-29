import 'package:flutter/material.dart';


class SignupCreatenameScreen extends StatefulWidget {
  const SignupCreatenameScreen({super.key});

  @override
  State<SignupCreatenameScreen> createState() => _SignupCreatenameScreenState();
}

class _SignupCreatenameScreenState extends State<SignupCreatenameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Text("Bạn tên gì?"),
              Text("Nhập tên bạn sử dụng trong đời thực")
            ],
          ),
        ),
      ),
    );
  }
}
