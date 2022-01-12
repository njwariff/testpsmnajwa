import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CustomInput extends StatelessWidget{
  final String hintText;
  final TextEditingController? controller;
  CustomInput({required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          hintText: hintText,
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}