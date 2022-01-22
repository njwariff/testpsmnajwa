import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:testpsm/screen/news_page.dart';
import 'package:testpsm/screen/view_memo.dart';

class Memo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Memo'), backgroundColor: Colors.brown,),
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

  final CollectionReference _memoRef = FirebaseFirestore.instance.collection("memo");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _memoRef.get(),
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
                              "${document['title']}",
                              style: Constants.regularHeading,
                            ),
                            trailing: Icon(Icons.navigate_next,),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ViewMemo(memoId: document.id,),
                              ));},
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