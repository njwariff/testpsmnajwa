import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:testpsm/screen/news_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {

  final CollectionReference _contactRef = FirebaseFirestore.instance.collection("contact");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _contactRef.get(),
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
                              "${document['name']}",
                              style: Constants.regularHeading,
                            ),
                            subtitle: Text(
                              "${document['phone']}",
                            ),
                            trailing: FloatingActionButton(
                              onPressed: () => launch("tel://094246999"),
                              child: const Icon(Icons.call),
                              backgroundColor: Colors.black,
                            ),
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