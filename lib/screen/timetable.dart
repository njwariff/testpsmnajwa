import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';


class Timetable extends StatefulWidget {
  final String studentsEmail;
  Timetable({required this.studentsEmail});

  @override
  _TimetableState createState() => _TimetableState();

}



class _TimetableState extends State<Timetable> {
  final CollectionReference _timetableRef = FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Timetable'), backgroundColor: Colors.brown,),
      body: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _timetableRef.where('email',isEqualTo:widget.studentsEmail).get(),
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
                  SingleStudents student = SingleStudents.fromDocumentSnapshot(
                      snapshot.data!.docs);
                  //print it out
                  print('students timetable - ${student.timetable}');


                  //collection data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    //display profile (data) dalam list view
                    print(snapshot.data);
                    return ListView(
                      children: [
                        SizedBox(height: 20,),

                        //sebab data type array(list in dart)
                        for (String url in student.timetable) Image.network(url),

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


class SingleStudents {
  final List timetable;


  SingleStudents({
    required this.timetable,

  });

  factory SingleStudents.fromDocumentSnapshot(docSnap) {
    print('data : ${docSnap[0].data()}');

    return SingleStudents(
      timetable: docSnap[0].data()['timetable'],

    );
  }

}