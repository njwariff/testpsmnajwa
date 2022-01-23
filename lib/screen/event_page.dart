import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class EventPage extends StatefulWidget {
  final String eventId;
  EventPage({required this.eventId});


  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final CollectionReference _eventRef = FirebaseFirestore.instance.collection("event");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details'), backgroundColor: Colors.blue,),
      body: Stack(
        children: [
          FutureBuilder(
            future: _eventRef.doc(widget.eventId).get(),
            builder: (context,snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              //news ready to shown by id
              if(snapshot.connectionState == ConnectionState.done) {
                SingleEvent event = SingleEvent.fromDocumentSnapshot(snapshot.data);
                //print it out
                print('event picture - ${event.picture}');
                print('event title - ${event.title}');
                print('event date - ${event.date}');
                print('event Venue - ${event.Venue}');


                //only show if has data
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      //sebab data type array(list in dart)
                      SizedBox(height: 20,),
                      for (String url in event.picture) Image.network(url),
                      SizedBox(height: 20,),
                      Text("${event.title}", style: Constants.regularHeading,),
                      SizedBox(height: 5,),
                      Text('Date :'"${event.date}", style: Constants.regularHeading,),
                      Text('Venue:'"${event.Venue}", style: Constants.regularHeading,),// can now use it here

                    ],
                  );
                } else {
                  return Text('Error:id not found');
                }
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

class SingleEvent {
  final List picture;
  final String title;
  final String date;
  final String Venue;



  SingleEvent({
    required this.picture,
    required this.title,
    required this.date,
    required this.Venue,
  });

  factory SingleEvent.fromDocumentSnapshot(docSnap) {
    print('picture : ${docSnap['picture']}');
    return SingleEvent(
      picture: docSnap['picture'],
      title: docSnap['title'],
      date: docSnap['date'],
      Venue: docSnap['Venue'],

    );
  }
}

