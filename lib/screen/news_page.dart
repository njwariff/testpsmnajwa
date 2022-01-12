import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final String newsId;
  NewsPage({required this.newsId});


  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final CollectionReference _newsRef = FirebaseFirestore.instance.collection("news");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _newsRef.doc(widget.newsId).get(),
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
                //Map<String, dynamic> documentData = snapshot.data.data();
                //snapshot.data!.map((document){}).toList();
                //print(snapshot.data!['title']);
                //getDocument(snapshot.data);
                //print('this is widgetID:${widget.newsId}');
                //print(widget.newsId);
                return ListView(

                  children: [
                    //Image.network("${documentData['picture'][0]}",),
                    Text("Title"),
                    Text("Description"),
                  ],
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
  void getDocument(snapshot)async{
    var documentData = await snapshot.data.get();
    print(documentData);
  }
}
