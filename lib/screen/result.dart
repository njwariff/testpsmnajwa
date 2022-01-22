import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:testpsm/screen/news_page.dart';

class Result extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Result'), backgroundColor: Colors.brown,),
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

  final CollectionReference _resultRef = FirebaseFirestore.instance.collection("result");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _resultRef.get(),
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
                    return DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Subject',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Desc',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Grade',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('BCC3024'),),
                            DataCell(Text('UNDERGRADUATE PROJECT II')),
                            DataCell(Text('TD')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('BCS3133'),),
                            DataCell(Text('SOFTWARE ENGINEERING PRACTICES')),
                            DataCell(Text('B+')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('BCS3143'),),
                            DataCell(Text('SOFTWARE PROJECT MANAGEMENT')),
                            DataCell(Text('A-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('BCS3133'),),
                            DataCell(Text('SOFTWARE ENGINEERING PRACTICES')),
                            DataCell(Text('B')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('BCS3263'),),
                            DataCell(Text('SOFTWARE QUALITY ASSURANCE')),
                            DataCell(Text('B')),
                          ],
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