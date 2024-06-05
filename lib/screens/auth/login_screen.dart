import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/screens/auth/signup_first_screen.dart';
import 'package:meta_app/screens/create_acount_first_screen.dart';
import 'package:meta_app/screens/messenger/ms_home_screen.dart';

import '../../resource/auth.resource.dart';
import '../../responsive/messenger/ms_mobile_layout.dart';
import '../../utils/utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userController.dispose();
    _passwordController.dispose();
  }
  void loginUser() async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _userController.text, password: _passwordController.text);
    if(res == "success"){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
      const MessageMobileLayout()
      ));
    }else{
      showSankBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void handleCreateOnTap(){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 300,
        color: Colors.blueGrey[800],
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            InkWell(
              onTap:() => Navigator.of(context).pop(),
              child: const Icon(Icons.close, color: Colors.grey),
            ),
            const SizedBox(height: 10,),

            const Text("Create account with Instagram", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w600, fontSize: 25),),
            const Text("Use login info from instagram to quickly create your Facebook account", style: TextStyle(color: Colors.white),),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 45,
                margin: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueAccent
                ),

                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.instagram, color: Colors.white,),

                    Text("  Countinue as vhoangbulon.dev", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignupFirstScreen()));
              },
              child: Container(
                width: double.infinity,
                height: 45,
                margin: const EdgeInsets.symmetric(vertical: 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1
                    )
                ),

                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("  Create account manually", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  void handleNagivateToCreateFirstScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateAcountFirstScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(),
        body:  SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 800,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  const Icon(Icons.facebook, color: Colors.blueAccent, size: 70,),
                  const SizedBox(height: 80,),
                  inputMethod(inputcontroller: _userController, lable: "Mobile number or email", isPassword: false, hintextInput: "Email"),
                  const SizedBox(height: 20,),
                  inputMethod(inputcontroller: _passwordController, lable: "Password", isPassword: true, hintextInput: "Password"),
                  InkWell(
                    onTap: loginUser,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: _isLoading ? const Center(child: CircularProgressIndicator(color: Colors.white,),) : Text("Log in", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  InkWell(child: Container(child: const Text("Forgot password?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),),),
                  Flexible(flex: 1,child: Container(),),
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: handleCreateOnTap,
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
          
                                border: Border.all(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: const Text("Create new account", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600),),
                            ),
                          ),
          
                           const Image(image: AssetImage("assets/logos/Meta_Logo.jpg"), width: 100,)
          
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        ),
        ),

      );

  }

  TextField inputMethod({required TextEditingController inputcontroller, required String lable, required bool isPassword, required String hintextInput}){
    return TextField(
      controller: inputcontroller,
      decoration:  InputDecoration(
          hintText: hintextInput,
          enabledBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              )
          ),

          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          label: Text('$lable')

      ),
      obscureText: isPassword,
    );
  }
}
