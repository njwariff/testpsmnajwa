import 'package:flutter/material.dart';
import 'package:testpsm/screen/login.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Login(),
    );
  }
}