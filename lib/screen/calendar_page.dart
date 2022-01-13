import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/screen/view_cal.dart';
import 'package:testpsm/tab/home_tab.dart';

import '../constants.dart';

class CalendarPage extends StatelessWidget {
  //StaffPage({Key? key}) : super(key: key);
  //static const String _title = 'Student Resident';

  final CollectionReference _calendarRef = FirebaseFirestore.instance.collection("cal");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _calendarRef.get(),
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
                    return Stack(
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            //leading: FlutterLogo(),
                            title: Text(
                              "${document['level']}",
                              style: Constants.regularHeading,
                            ),
                            trailing: Icon(Icons.navigate_next,),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ViewCal(calId: document.id,),
                                ));},
                          ),
                        ),
                      ],
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
