import 'package:flutter/material.dart';
import 'package:testpsm/widget/custom_btn.dart';
import 'package:testpsm/widget/custom_input.dart';
import '../constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
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
                    text: "Register",
                    onPressed: (){
                      print("Clicked Register Button");
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
                    text: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  outlinedBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
      // add bg color to login page
      backgroundColor: Colors.brown,
    );
  }
}
