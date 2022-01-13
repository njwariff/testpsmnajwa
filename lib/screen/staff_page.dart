import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/tab/home_tab.dart';

import '../constants.dart';

class StaffPage extends StatelessWidget {
  //StaffPage({Key? key}) : super(key: key);
  //static const String _title = 'Staff Directory';

  final CollectionReference _staffRef = FirebaseFirestore.instance.collection("staff");
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: buildPost(context),
  );

  @override
  Widget buildPost(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _staffRef.get(),
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
                //display staff (data) dalam list view
                print(snapshot.data);
                return ListView(
                  children: snapshot.data!.docs.map((document){
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        height: 70.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Stack(
                          children: [
                            //container for picture
                            Container(
                              height: 200.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child:
                                Image.network(
                                  "${document['image'][0]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 70,
                              right: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    Text(
                                    "${document['name']}",
                                      //style: Constants.regularHeading,
                                    ),

                                  Text(
                                    "${document['position']}",
                                  ),
                                  Text(
                                    "${document['email']}",
                                  ),
                                  Text(
                                    "${document['phone']}",
                                  ),
                                ],
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
