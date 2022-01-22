import 'package:flutter/material.dart';
import 'package:testpsm/button/staff_btn.dart';
import 'package:testpsm/button/contact_btn.dart';
import 'package:testpsm/button/calendar_btn.dart';
import 'package:testpsm/button/rapid_btn.dart';
import 'package:testpsm/button/resident_btn.dart';
import 'package:testpsm/screen/event.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  static const String _title = '                        UMPiNtel';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [ Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: 'staff dir',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StaffBtn(),
                  ));
            },
            child: const Icon(Icons.people_alt_rounded),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: 'student resident',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResidentBtn(),
                  ));
            },
            child: const Icon(Icons.apartment_rounded),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: 'rapid bus',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RapidBtn(),
                  ));
            },
            child: const Icon(Icons.airport_shuttle_sharp),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: 'academic calendar',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalendarBtn(),
                  ));
            },
            child: const Icon(Icons.calendar_today_outlined),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: 'contact',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactBtn(),
                  ));
            },
            child: const Icon(Icons.call_sharp),
          ),
        ],
      ),
    ),
      // SizedBox(
      //   height: 5,
      // ),
      // Column(
      //   children: <Widget>[
      //     //Event(),
      //   ],
      // ),
      Positioned(
          top: 105,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            decoration: (BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(30),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(text: TextSpan(
                      text: "UMP EVENT",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    ))
                  ],
                ),
                // Column(
                //   children: <Widget>[
                //     Event(),
                //   ],
                // )
                SizedBox(
                  height: 20,
                ),
                // Column(
                //   children: <Widget>[
                //     Event(),
                //   ],
                // ),

                // //ump event list
                Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:
                    // child: Event(),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "Jan",
                          //   style: TextStyle(fontWeight: FontWeight.bold),
                          // ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Titleeee",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.pin_drop_sharp,
                                color: Colors.black,
                                size: 20,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "tempatt zoom ump gambang",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                //end of event list
                      ),
                      ],
                      ),
            ),
            ),
    ],
    );
  }
}
