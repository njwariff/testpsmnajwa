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
    children: [
      Column(
        children: [
        Container(
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
        Positioned(
            top: 185,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
              height: MediaQuery.of(context).size.height - 252,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30),
            ),
             child: GestureDetector(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(
              builder: (context) => Event(),
              ));
              },
            child: Column(
              children: [
                // SizedBox(
                //   width: 20,
                // ),
                Row(
                  children: [
                    RichText(text: TextSpan(text: "UMP EVENT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                      SizedBox(
                        height: 15,
                      ),
                      //untuk route to page event
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child:
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "24",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                               Text(
                                    "Jan",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                  ),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 100,
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                   ),
                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                    Text(
                                    "PROGRAM CERAMAH FARMASI",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                      Text(
                                        "BERSAMA MASYARAKAT",
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
                                    "Google Meet Application",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time_outlined,
                                            color: Colors.black,
                                            size: 20,),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "02:00 PM",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                  ],
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.withOpacity(0.5),
                    ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Event(),
                        ));
                  },
                  child: const Text('View All',),)
                    ],
            ),
      ),
        ),
        ),
      ],
    ),
    ],
      );
  }
}
