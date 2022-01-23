import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';


class Merit extends StatefulWidget {
  final String studentsEmail;
  Merit({required this.studentsEmail});

  @override
  _MeritState createState() => _MeritState();

}



class _MeritState extends State<Merit> {
  final CollectionReference _meritRef = FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stdent Merit'), backgroundColor: Colors.brown,),
      body: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _meritRef.where('email',isEqualTo:widget.studentsEmail).get(),
              builder: (context,snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }

                //students ready to shown by id
                if (snapshot.connectionState == ConnectionState.done) {
                  SingleMerit student = SingleMerit.fromDocumentSnapshot(
                      snapshot.data!.docs);
                  //print it out
                  print('students fees - ${student.merit}');


                  //collection data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    //display profile (data) dalam list view
                    print(snapshot.data);
                    return ListView(
                      children: [
                        SizedBox(height: 20,),

                        //sebab data type array(list in dart)
                        for (String url in student.merit) Image.network(url),

                      ],

                    );
                  }


                };
                //loading state
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class SingleMerit{
  final List merit;


  SingleMerit({
    required this.merit,

  });

  factory SingleMerit.fromDocumentSnapshot(docSnap) {
    print('data : ${docSnap[0].data()}');

    return SingleMerit(
      merit: docSnap[0].data()['merit'],

    );
  }

}