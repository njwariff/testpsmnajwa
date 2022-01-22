import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Event extends StatelessWidget {

  final CollectionReference _eventRef = FirebaseFirestore.instance.collection("event");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _eventRef.get(),
            builder: (context,snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              //collection data ready to display
              // if(snapshot.connectionState == ConnectionState.done){
              //   //display news (data) dalam list view
              //   print(snapshot.data);
              //   return ListView(
              //     children: snapshot.data!.docs.map((document){
              //       return Stack(
              //         children: <Widget>[
              //           //ump event list
              //           Container(
              //             padding: EdgeInsets.all(10),
              //             //height: 100,
              //             decoration: BoxDecoration(
              //               color: Colors.white70,
              //               borderRadius: BorderRadius.circular(30),
              //             ),
              //             child:
              //             Row(
              //               children: [
              //                 Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       "${document['date']}",
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     // Text(
              //                     //   "Jan",
              //                     //   style: TextStyle(fontWeight: FontWeight.bold),
              //                     // ),
              //                   ],
              //                 ),
              //                 Container(
              //                   height: 100,
              //                   width: 1,
              //                   color: Colors.grey.withOpacity(0.5),
              //                 ),
              //                 Column(
              //                   //crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                   children: [
              //                     Text(
              //                       "${document['time']}",
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     Text(
              //                       "${document['title']}",
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     Row(
              //                       children: [
              //                         Icon(Icons.pin_drop_sharp,
              //                           color: Colors.black,
              //                           size: 20,),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Text(
              //                           "${document['Venue']}",
              //                           style: TextStyle(fontWeight: FontWeight.bold),
              //                         ),
              //                       ],
              //                     )
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         ],
              //       );
              //     }).toList(),
              //   );
              // }

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