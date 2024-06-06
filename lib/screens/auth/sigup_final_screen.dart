import 'dart:typed_data';


import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta_app/screens/messenger/ms_home_screen.dart';

import '../../resource/auth.resource.dart';
import '../../utils/utils.dart';
import '../../widgets/text_field_input.dart';

import 'login_screen.dart';

class SignUpFinalScreen extends StatefulWidget {
  const SignUpFinalScreen({super.key});

  @override
  _SignUpFinalScreenState createState() => _SignUpFinalScreenState();
}

class _SignUpFinalScreenState extends State<SignUpFinalScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }
  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    if(_image == null){
      showSankBar("File not null", context);
      return;
    }
    String res = await AuthMethods().signupUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!
    );
    setState(() {
      _isLoading = false;
    });
    if(res != "success"){
      showSankBar(res, context);
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
      const LoginScreen()
      ));
    }

  }
  void navigateToLogin(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            height: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 2,),
                // svg image
                SvgPicture.asset("assets/logos/facebook_logo.svg", color: Colors.blue, height: 34,),
                const SizedBox(height: 64,),
                // Cicular widget to accept and show our selected file
                Stack(
                  children: [
                    _image!= null
                        ?
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                        : const CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage("assets/images/testImage.jpg")),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(
                              Icons.add_a_photo
                          ),
                        )
                    )
                  ],
                ),
                const SizedBox(height: 24,),
          
                // Text field input for username
                TextFieldInput(
                    textEditingController: _usernameController,
                    hintText: "Enter your username",
                    textInputType: TextInputType.text
                ),
                const SizedBox(height: 24,),
                // Text field input email
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: "Enter your email",
                    textInputType: TextInputType.emailAddress
                ),
                const SizedBox(height: 24,),
                // Text field input password
                TextFieldInput(
                    textEditingController: _passwordController,
                    hintText: "Enter your password",
                    textInputType: TextInputType.text,
                    isPass: true
                ),
                const SizedBox(height: 24,),
                // Text field input bio
                TextFieldInput(
                  textEditingController: _bioController,
                  hintText: "Enter your bio",
                  textInputType: TextInputType.text,
          
                ),
                const SizedBox(height: 24,),
                // Button Login
                InkWell(
                  onTap: signUpUser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        color: Colors.blue
                    ),
                    child:_isLoading ? const Center(child: CircularProgressIndicator(color: Colors.white,),) : const Text("Signup"),
                  ),
                ),
                const SizedBox(height: 24,),
                Flexible(child:  Container(), flex: 2,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Have an account"),
                    ),
                    GestureDetector(
                      onTap: navigateToLogin,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text("Login",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 14,),
                // Transitiontin to signing up
              ],
            ),
          ),
        ),
      ),
    );
  }
}

