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
                    return
                    Column(
                      children: [
                      // SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                      height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 100,
                        decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:
                      // child: Event(),
                        Row(
                          children: [
                            Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                        height: 70.0,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12.0),
                                          child:
                                          Image.network(
                                            "${document['image'][0]}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
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
                          "${document['name']}",
                          style: TextStyle( fontWeight: FontWeight.bold,),
                          ),
                        Text(
                          "${document['position']}",
                          //style: Constants.regularHeading,
                        ),
                        Text(
                          "${document['email']}",
                          //style: Constants.regularHeading,
                        ),
                        Text(
                          "${document['phone']}",
                          //style: Constants.regularHeading,
                        ),
                        ],
                     ),
                    ],
                   ),
                      ),
                      SizedBox(
                      //width: 2,
                      height: 4,
                      ),
                    ],

                    );
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(12.0),
                      //   ),
                      //   height: 70.0,
                      //   margin: EdgeInsets.symmetric(
                      //     vertical: 12.0,
                      //     horizontal: 24.0,
                      //   ),
                      //   child: Stack(
                      //     children: [
                      //       //container for picture
                      //       Container(
                      //         height: 200.0,
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(12.0),
                      //           child:
                      //           Image.network(
                      //             "${document['image'][0]}",
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //       Positioned(
                      //         top: 0,
                      //         bottom: 0,
                      //         left: 70,
                      //         right: 0,
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: <Widget>[
                      //               Text(
                      //               "${document['name']}",
                      //                 //style: Constants.regularHeading,
                      //               ),
                      //
                      //             Text(
                      //               "${document['position']}",
                      //             ),
                      //             Text(
                      //               "${document['email']}",
                      //             ),
                      //             Text(
                      //               "${document['phone']}",
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // );
                  }).toList(),

                  );
               // List.sort((a, b) => a.toString().compareTo(b.toString()));
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
