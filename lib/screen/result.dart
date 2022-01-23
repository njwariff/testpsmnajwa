import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';


class Result extends StatefulWidget {
  final String studentsEmail;
  Result({required this.studentsEmail});

  @override
  _ResultState createState() => _ResultState();

}



class _ResultState extends State<Result> {
  final CollectionReference _resultRef = FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Result'), backgroundColor: Colors.brown,),
      body: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _resultRef.where('email',isEqualTo:widget.studentsEmail).get(),
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
                  print('students picture - ${student.result}');


                  //collection data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    //display profile (data) dalam list view
                    print(snapshot.data);
                    return ListView(
                      children: [
                        SizedBox(height: 20,),

                        //sebab data type array(list in dart)
                        for (String url in student.result) Image.network(url),

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
  final List result;


  SingleStudents({
    required this.result,

  });

  factory SingleStudents.fromDocumentSnapshot(docSnap) {
    print('data : ${docSnap[0].data()}');

    return SingleStudents(
      result: docSnap[0].data()['result'],

    );
  }

}