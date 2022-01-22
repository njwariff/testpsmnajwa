import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ViewMemo extends StatefulWidget {
  ///static  String _title = 'Staff Directory';

  final String memoId;
  ViewMemo({required this.memoId});


  @override
  _ViewMemoState createState() => _ViewMemoState();
}

class _ViewMemoState extends State<ViewMemo> {
  final CollectionReference _memoRef = FirebaseFirestore.instance.collection("memo");

  @override
  Widget build(BuildContext context) {
    //String _title = 'Memo';
    return Scaffold(
      appBar: AppBar(title: Text('Message'), backgroundColor: Colors.brown,),
      body: Stack(
        children: [
          FutureBuilder(
            future: _memoRef.doc(widget.memoId).get(),
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
                SingleMemo memo = SingleMemo.fromDocumentSnapshot(snapshot.data);
                //print it out
                //print('news picture - ${news.picture}');
                print('news title - ${memo.title}');
                print('news date - ${memo.date}');
                print('news text - ${memo.text}');


                //only show if has data
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      //sebab data type array(list in dart)
                      //for (String url in news.picture) Image.network(url),
                      //Image.network("${news.picture}",),
                      Text('Subject:' "${memo.title}", style: Constants.regularHeading,),// can now use it here
                      Text('Date:' "${memo.date}",),
                      Text('Message:' "${memo.text}",),
                    ],
                  );
                } else {
                  return Text('Error:id not found');
                }
              }

              //loading state
              return Scaffold(
                appBar: AppBar(title: Text('Memo'), backgroundColor: Colors.brown,),
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

class SingleMemo {
  final String title;
  final String date;
  final String text;

  SingleMemo({
    required this.title,
    required this.date,
    required this.text,
  });

  factory SingleMemo.fromDocumentSnapshot(docSnap) {
    //print('picture : ${docSnap['picture']}');
    return SingleMemo(
      title: docSnap['title'],
      date: docSnap['date'],
      text: docSnap['text'],
    );
  }
}

