import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pacamanappthree/view/screen/HomePage.dart';
import '../../controller/fethGoogleLogin.dart';
import '../wedgit/myButton.dart';
class loginWithGoogle extends GetWidget<fethGoogleLogin> {
  const loginWithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Container(

          padding: EdgeInsets.only(top: 350),
          child: Column(
            children: [
              MyButton(
                  lable: "Login With Google",
                  onTap: () {
                    controller.googleSignMethod();
                  },
                  width: 250,
                  height: 50),
              SizedBox(height: 100,),
              MyButton(
                  lable: "Login With Gust",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>  HomePage()),
                    );
                  },
                  width: 250,
                  height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

