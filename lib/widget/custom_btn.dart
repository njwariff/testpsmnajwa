import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String  text;
  final Function onPressed;
  final bool outlinedBtn;
  CustomBtn({required this.text,required this.onPressed, required this.outlinedBtn});

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn = outlinedBtn;

    return GestureDetector(
      onTap: () {
        onPressed();
      },

      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            12.0,
          ),
      ),
        margin: EdgeInsets.symmetric(
          horizontal: 100.0,
          vertical: 8.0,
      ),
      child: Text(
          text,
        style: TextStyle(
            fontSize: 17.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
       ),
      ),
    );
  }
}
