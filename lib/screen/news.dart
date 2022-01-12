import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:testpsm/screen/news_page.dart';

class News extends StatelessWidget {

  final CollectionReference _newsRef = FirebaseFirestore.instance.collection("news");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _newsRef.get(),
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
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => NewsPage(newsId: document.id,),
                        ));
                      },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: 350.0,
                     margin: EdgeInsets.symmetric(
                       vertical: 12.0,
                       horizontal: 24.0,
                     ),
                      child: Stack(
                     children: [
                       Container(
                         height: 330.0,
                       child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                      child:
                      //Text("${document['title']}"),
                      Image.network(
                          "${document['picture'][0]}",
                          fit: BoxFit.cover,

                           ),
                          ),
                       ),
                       Positioned(
                         bottom: 0,
                       child: Row(
                         children: [
                           Text("${document['title']}", style: Constants.regularHeading,),
                         ],
                       ),
                       ),
                        ],
                       ),
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