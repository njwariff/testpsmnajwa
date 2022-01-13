import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/tab/home_tab.dart';

import '../constants.dart';

class RapidPage extends StatelessWidget {
  //StaffPage({Key? key}) : super(key: key);
  //static const String _title = 'Student Resident';

  final CollectionReference _rapidRef = FirebaseFirestore.instance.collection("rapid");


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _rapidRef.get(),
            builder: (context,snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              //collection data ready to display
              if(snapshot.connectionState == ConnectionState.done){
                //display news (data) dalam list view
                print(snapshot.data);
                return ListView(
                  children: snapshot.data!.docs.map((document){
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        height: 500.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 400.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child:
                                //Text("${document['title']}"),
                                Image.network(
                                  "${document['image'][0]}",
                                  fit: BoxFit.cover,

                                ),
                              ),
                            ),

                          ],
                    ),
                    );
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
          ),
        ],
      ),
    );
  }
}
