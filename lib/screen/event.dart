import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:testpsm/screen/news_page.dart';

import 'event_page.dart';

class Event extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('UMP EVENT'), backgroundColor: Colors.blue,),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

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
              if(snapshot.connectionState == ConnectionState.done){
                //display profile (data) dalam list view
                print(snapshot.data);
                return ListView(
                  children: snapshot.data!.docs.map((document){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => EventPage(eventId: document.id,),
                        ));
                      },
                    child:
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
                                  Text(
                                    "${document['dateday']}",
                                    //style: Constants.regularHeading,
                                  ),
                                  Text(
                                    "${document['month']}",
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
                                    "${document['titlefront']}",
                                    //style: Constants.regularHeading,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.pin_drop_sharp,
                                        color: Colors.black,
                                        size: 20,),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${document['Venue']}",
                                        //style: Constants.regularHeading,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_outlined,
                                        color: Colors.black,
                                        size: 20,),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${document['time']}",
                                        //style: Constants.regularHeading,
                                      ),
                                    ],
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