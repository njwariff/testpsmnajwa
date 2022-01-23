import 'package:firebase_auth/firebase_auth.dart';
import 'package:testpsm/constants.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/services/auth_services.dart';
import 'package:testpsm/widget/custom_btn.dart';
import 'package:testpsm/widget/custom_input.dart';
import '../constants.dart';
import 'home_two.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var authHandler = new AuthService();
  TextEditingController emailctrlr = TextEditingController();
  TextEditingController passwordctrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 50.0,
                ),
                child: Text(
                    "UMPINTEL",
                    style: Constants.boldHeading,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                 bottom: 190,
                ),
              child:
              Column(
                children: [
                  CustomInput(
                    hintText: "Email ID",
                    controller: emailctrlr,
                  ),
                  CustomInput(

                    hintText: "Password",
                    controller: passwordctrlr,
                  ),
                  CustomBtn(
                    text: "Login",
                    onPressed: () {
                      print("Clicked Login Button");
                      authHandler.handleSignInEmail(emailctrlr.text, passwordctrlr.text).then((User user) {
                        print('user:${user.displayName}');
                      }).catchError((e) => print(e));
                    },
                    outlinedBtn: true,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 16.0),
              //   child: CustomBtn(
              //     text: 'Register',
              //     onPressed: () {
              //     print('aaa');
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => RegisterPage(),
              //     ),
              //   );
              // },
              //   outlinedBtn: true,
              // ),
              ),
            ],
          ),
        ),
      ),
      // add bg color to login page
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}