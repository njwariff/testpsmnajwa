import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/constants.dart';
import 'package:testpsm/screen/news_page.dart';

class TimeTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Timetable'), backgroundColor: Colors.brown,),
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

  final CollectionReference _timetableRef = FirebaseFirestore.instance.collection("timetable");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _timetableRef.get(),
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
                            'Slot/Day',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'MON',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'TUE',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'WED',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'THURS',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'FRI',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'SAT',
                            //style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),

                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('7:00-7:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('7:00-7:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('7:00-7:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('7:00-7:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('7:00-7:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('8:00-8:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('9:00-9:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('10:00-10:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('11:00-11:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('12:00-12:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('1:00-1:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('2:00-2:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('3:00-3:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('4:00-4:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('5:00-5:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('6:00-6:50'),),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
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