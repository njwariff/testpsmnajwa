import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:testpsm/screen/news_page.dart';

class Profile extends StatefulWidget {
  final String studentsId;
  Profile({required this.studentsId});

  @override
  _ProfileState createState() => _ProfileState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Profile'), backgroundColor: Colors.brown,),
        body: Profile(studentsId: '',),
      ),
    );
  }
}


// class MyStatefulWidget extends StatefulWidget {
//
//   const MyStatefulWidget({Key? key}) : super(key: key);
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

class _ProfileState extends State<Profile> {
  final CollectionReference _profileRef = FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _profileRef.doc(widget.studentsId).get(),
            builder: (context,snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              //news ready to shown by id
              if (snapshot.connectionState == ConnectionState.done) {
                SingleStudents students = SingleStudents.fromDocumentSnapshot(
                    snapshot.data);
                //print it out
                print('students picture - ${students.picture}');
                print('students name - ${students.name}');
                print('students matric - ${students.matric}');


                //collection data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  //display profile (data) dalam list view
                  print(snapshot.data);
                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      return DataTable(
                        columns:  <DataColumn>[
                          //for (String url in students.picture) Image.network(url),
                          DataColumn(
                            label: Text(
                              'Name',
                              //style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "${students.name}",
                              //style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows:  <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Student ID'),),
                              DataCell(Text("${students.matric}",)),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('IC')),
                              DataCell(Text('970827035760')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Faculty')),
                              DataCell(Text('Faculty of Computer')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Course')),
                              DataCell(Text(
                                  'BCS - SARJANA MUDA SAINS KOMPUTER (KEJURUTERAAN PERISIAN) DENGAN KEPUJIAN')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Email')),
                              DataCell(Text('njwarff@gmail.com')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Advisor')),
                              DataCell(Text('Mohd Zamri Bin Osman')),
                            ],
                          ),
                        ],
                      );
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(12.0),
                      //     ),
                      //     height: 350.0,
                      //     margin: EdgeInsets.symmetric(
                      //       vertical: 12.0,
                      //       horizontal: 24.0,
                      //     ),
                      //     child: Stack(
                      //       children: [
                      //         Container(
                      //           height: 330.0,
                      //           child: ClipRRect(
                      //             borderRadius: BorderRadius.circular(12.0),
                      //             child:
                      //             //Text("${document['title']}"),
                      //             Image.network(
                      //               "${document['picture'][0]}",
                      //               fit: BoxFit.cover,
                      //
                      //             ),
                      //           ),
                      //         ),
                      //         Positioned(
                      //           bottom: 0,
                      //           child: Row(
                      //             children: [
                      //               Text("${document['title']}", style: Constants.regularHeading,),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
                    }).toList(),
                  );
                }

                //loading state
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
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

  SingleStudents({
    required this.picture,
    required this.name,
    required this.matric,
  });

  factory SingleStudents.fromDocumentSnapshot(docSnap) {
    print('picture : ${docSnap['picture']}');
    return SingleStudents(
      picture: docSnap['picture'],
      name: docSnap['name'],
      matric: docSnap['matric'],
    );
  }
}