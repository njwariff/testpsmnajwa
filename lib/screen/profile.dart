import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';


class Profile extends StatefulWidget {
  final String studentsEmail;
  Profile({required this.studentsEmail});

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  final CollectionReference _profileRef = FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile'), backgroundColor: Colors.brown,),
      body: Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
           future: _profileRef.where('email',isEqualTo:widget.studentsEmail).get(),
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
                print('students picture - ${student.picture}');
                print('students name - ${student.name}');
                print('students matric - ${student.matric}');
                print('students ic - ${student.ic}');
                print('students advisor - ${student.advisor}');
                print('students course - ${student.course}');
                print('students faculty - ${student.faculty}');


                //collection data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  //display profile (data) dalam list view
                  print(snapshot.data);
                  return ListView(
                    children: [

                      //sebab data type array(list in dart)
                      for (String url in student.picture) Image.network(url),
                      SizedBox(height: 10,),
                      Text('Name      : '"${student.name}", style: Constants.regularHeading,),
                      SizedBox(height: 5,),
                      Text('Student ID: '"${student.matric}", style: Constants.regularHeading,),
                      SizedBox(height: 5,),
                      Text('IC        : '"${student.ic}", style: Constants.regularHeading,),
                      SizedBox(height: 5,),
                      Text('Course    : '"${student.course}", style: Constants.regularHeading,),
                      SizedBox(height: 5,),
                      Text('Faculty   : '"${student.faculty}", style: Constants.regularHeading,),
                      SizedBox(height: 5,),
                      Text('Advisor   : '"${student.advisor}", style: Constants.regularHeading,),

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
  final List picture;
  final String name;
  final String matric;
  final String ic;
  final String course;
  final String advisor;
  final String faculty;

  SingleStudents({
    required this.picture,
    required this.name,
    required this.matric,
    required this.ic,
    required this.course,
    required this.advisor,
    required this.faculty,

  });

  factory SingleStudents.fromDocumentSnapshot(docSnap) {
    print('data : ${docSnap[0].data()}');

    return SingleStudents(
      picture: docSnap[0].data()['picture'],
      name: docSnap[0].data()['name'],
      matric: docSnap[0].data()['matric'],
      ic: docSnap[0].data()['ic'],
      course: docSnap[0].data()['course'],
      advisor: docSnap[0].data()['advisor'],
      faculty: docSnap[0].data()['faculty'],
    );
  }

}