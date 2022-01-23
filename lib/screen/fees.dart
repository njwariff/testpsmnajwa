import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';


class Fees extends StatefulWidget {
  final String studentsEmail;
  Fees({required this.studentsEmail});

  @override
  _FeesState createState() => _FeesState();

}



class _FeesState extends State<Fees> {
  final CollectionReference _feesRef = FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Ledger'), backgroundColor: Colors.brown,),
      body: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _feesRef.where('email',isEqualTo:widget.studentsEmail).get(),
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
                  SingleFees student = SingleFees.fromDocumentSnapshot(
                      snapshot.data!.docs);
                  //print it out
                  print('students fees - ${student.fees}');


                  //collection data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    //display profile (data) dalam list view
                    print(snapshot.data);
                    return ListView(
                      children: [
                        SizedBox(height: 20,),

                        //sebab data type array(list in dart)
                        for (String url in student.fees) Image.network(url),

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


class SingleFees {
  final List fees;


  SingleFees({
    required this.fees,

  });

  factory SingleFees.fromDocumentSnapshot(docSnap) {
    print('data : ${docSnap[0].data()}');

    return SingleFees(
      fees: docSnap[0].data()['fees'],

    );
  }

}