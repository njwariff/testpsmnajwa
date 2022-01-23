import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:url_launcher/link.dart';


class Deadline extends StatefulWidget {
  final String studentsEmail;
  Deadline({required this.studentsEmail});

  @override
  _DeadlineState createState() => _DeadlineState();

}

class _DeadlineState extends State<Deadline> {
  final CollectionReference _deadlineRef = FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dateline List'), backgroundColor: Colors.brown,),
      body: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _deadlineRef.where('email',isEqualTo:widget.studentsEmail).get(),
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
                  SingleDeadline deadline = SingleDeadline.fromDocumentSnapshot(
                      snapshot.data!.docs);
                  //print it out
                  print('deadline timetable - ${deadline.dateUrl}');
                  print('deadline timetable - ${deadline.orUrl}');


                  //collection data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    //display profile (data) dalam list view
                    print(snapshot.data);
                    return ListView(
                      children: [
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            // SizedBox(
                            //   width: 20,
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            //e-pat
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child:
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "31",
                                        //style: Constants.regularHeading,
                                      ),
                                      Text(
                                        "Jan",
                                        //style: Constants.regularHeading,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                      Text(
                                        "E-Pat Evaluation",
                                        //style: Constants.regularHeading,
                                      ),
                                      Link(
                                        target: LinkTarget.blank,
                                        uri: Uri.parse("${deadline.dateUrl}",),
                                        builder: (context, followLink) =>
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                ),
                                                onPressed: followLink, child: Text('Open Link')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 2,
                              height: 20,
                            ),
                            //open registration
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child:
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "07",
                                        //style: Constants.regularHeading,
                                      ),
                                      Text(
                                        "Feb",
                                        //style: Constants.regularHeading,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                      Text(
                                        "Open Registration",
                                        //style: Constants.regularHeading,
                                      ),
                                      Link(
                                        target: LinkTarget.blank,
                                        uri: Uri.parse("${deadline.orUrl}",),
                                        builder: (context, followLink) =>
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                ),
                                                onPressed: followLink, child: Text('Open Link')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ),
                          ],
                        ),

                        //start sini
                        //Text('Student ID: '"${deadline.dateUrl}", style: Constants.regularHeading,),

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


class SingleDeadline {
  final String dateUrl;
  final String orUrl;


  SingleDeadline({
    required this.dateUrl,
    required this.orUrl,

  });

  factory SingleDeadline.fromDocumentSnapshot(docSnap) {
    print('data : ${docSnap[0].data()}');

    return SingleDeadline(
      dateUrl: docSnap[0].data()['dateUrl'],
      orUrl: docSnap[0].data()['orUrl'],

    );
  }

}