import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

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
                SingleNews news = SingleNews.fromDocumentSnapshot(snapshot.data);
              //print it out
                  print('news picture - ${news.picture}');
                  print('news title - ${news.title}');
                  print('news desc - ${news.description}');


              //only show if has data
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    //sebab data type array(list in dart)
                    for (String url in news.picture) Image.network(url),
                    //Image.network("${news.picture}",),
                    Text("${news.title}", style: Constants.regularHeading,),// can now use it here
                    Text("${news.description}",),
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

class SingleNews {
  final List picture;
  final String title;
  final String description;

  SingleNews({
    required this.picture,
    required this.title,
    required this.description,
  });

  factory SingleNews.fromDocumentSnapshot(docSnap) {
    print('picture : ${docSnap['picture']}');
    return SingleNews(
      picture: docSnap['picture'],
      title: docSnap['title'],
      description: docSnap['description'],
    );
  }
}

