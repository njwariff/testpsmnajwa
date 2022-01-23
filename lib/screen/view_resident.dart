import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import '../constants.dart';

class ViewResident extends StatefulWidget {
  final String residentId;
  ViewResident({required this.residentId});


  @override
  _ViewResidentState createState() => _ViewResidentState();
}

class _ViewResidentState extends State<ViewResident> {
  final CollectionReference _residentRef = FirebaseFirestore.instance.collection("resident");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Facilities'), backgroundColor: Colors.blue,),
      body: Stack(
        children: [
          FutureBuilder(
            future: _residentRef.doc(widget.residentId).get(),
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
                SingleResident resident = SingleResident.fromDocumentSnapshot(snapshot.data);
                //print it out
                print('resident image - ${resident.image}');
                print('resident name - ${resident.name}');
                print('resident url - ${resident.url}');


                //only show if has data
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      //sebab data type array(list in dart)
                      SizedBox(height: 10,),
                      for (String url in resident.image) Image.network(url),
                      //Image.network("${news.picture}",),
                      Text("${resident.name}", style: Constants.regularHeading,),// can now use it here
                      //Text("${resident.url}",),

                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse("${resident.url}",),
                        builder: (context, followLink) =>
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                ),
                                onPressed: followLink, child: Text('Open Link')),
                      ),
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

class SingleResident {
  final List image;
  final String name;
  final String url;

  SingleResident({
    required this.image,
    required this.name,
    required this.url,
  });

  factory SingleResident.fromDocumentSnapshot(docSnap) {
    print('image : ${docSnap['image']}');
    return SingleResident(
      image: docSnap['image'],
      name: docSnap['name'],
      url: docSnap['url'],
    );
  }
}

