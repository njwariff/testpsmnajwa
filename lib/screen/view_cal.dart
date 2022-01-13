import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ViewCal extends StatefulWidget {
  final String calId;
  ViewCal({required this.calId});


  @override
  _ViewCalState createState() => _ViewCalState();
}

class _ViewCalState extends State<ViewCal> {
  final CollectionReference _calRef = FirebaseFirestore.instance.collection("cal");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _calRef.doc(widget.calId).get(),
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
                SingleCal cal = SingleCal.fromDocumentSnapshot(snapshot.data);
                //print it out
                print('news picture - ${cal.image}');


                //only show if has data
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      //sebab data type array(list in dart)
                      for (String url in cal.image) Image.network(url),
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

class SingleCal {
  final List image;

  SingleCal({
    required this.image,
  });

  factory SingleCal.fromDocumentSnapshot(docSnap) {
    print('image : ${docSnap['image']}');
    return SingleCal(
      image: docSnap['image'],
    );
  }
}

