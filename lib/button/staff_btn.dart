import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/screen/staff_page.dart';
import 'package:testpsm/tab/home_tab.dart';
import '../constants.dart';

class StaffBtn extends StatelessWidget {
  StaffBtn({Key? key}) : super(key: key);
  static  String _title = 'Staff Directory';

  //final CollectionReference _staffRef = FirebaseFirestore.instance.collection("staff");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title), backgroundColor: Colors.blueGrey,),
        body: StaffPage(),
      ),
     );
    }
}
