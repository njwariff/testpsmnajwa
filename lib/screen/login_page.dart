import 'package:testpsm/constants.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/screen/register_page.dart';
import 'package:testpsm/widget/custom_btn.dart';
import 'package:testpsm/widget/custom_input.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              Column(
                children: [
                  CustomInput(
                    hintText: "Matric ID",
                  ),
                  CustomInput(
                    hintText: "Password",
                  ),
                  CustomBtn(
                    text: "Login",
                    onPressed: (){
                      print("Clicked Login Button");
                    },
                    outlinedBtn: true,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0
                ),
                child: CustomBtn(
                  text: 'Register',
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                          ),
                      );
                    },
                  outlinedBtn: true,
                ),

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