import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/screen/contact_page.dart';
import 'package:testpsm/screen/resident_page.dart';

class ContactBtn extends StatelessWidget {
  ContactBtn({Key? key}) : super(key: key);
  static  String _title = 'Contact Information';

  //final CollectionReference _residentRef = FirebaseFirestore.instance.collection("resident");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title), backgroundColor: Colors.blueGrey,),
        body: ContactPage(),
      ),
    );
  }
}