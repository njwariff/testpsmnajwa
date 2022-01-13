import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/screen/calendar_page.dart';

class CalendarBtn extends StatelessWidget {
  const CalendarBtn({Key? key}) : super(key: key);
  static  String _title = 'Student Academic Calendar';

  //final CollectionReference _residentRef = FirebaseFirestore.instance.collection("resident");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title), backgroundColor: Colors.blueGrey,),
        body: CalendarPage(),
      ),
    );
  }
}