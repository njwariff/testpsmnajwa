import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/button/staff_btn.dart';
import 'package:testpsm/screen/profile.dart';
import 'package:testpsm/screen/result.dart';
import 'package:testpsm/screen/timetable.dart';
import 'package:testpsm/services/auth_services.dart';

import 'deadline.dart';
import 'fees.dart';
import 'memo.dart';
import 'merit.dart';

class HomeTwo extends StatelessWidget {
  const HomeTwo({Key? key}) : super(key: key);
  static const String _title = 'HomePage Two';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    initUser();
    // TODO: implement initState
    super.initState();
  }

  initUser() async {
    print('currentUserHomeTwo:${FirebaseAuth.instance.currentUser}');
    user = await _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  String userEmail = (user == null) ? '' : user!.email!;
    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onSecondary);
    return Stack(
    children: [
      Container(
      child: Scaffold(
      //TITTLE BLUE BIG
      appBar: AppBar(actions: <Widget>[
        TextButton(
        style: style,
        onPressed: () {
            _auth.signOut();
        },
          child: const Icon(Icons.logout,),
          ),
         ],
      ),

      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 8,
                      )
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "http://bimcbali.com/wp-content/themes/mmp-hospital/img/profile.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Home Two Email:${user!.email}'),
                    Text(
                          'Hi, ${user!.email}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0XFF343E87),
                      ),
                     ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            //start of elevated btn
            child: Row(
              children: [
                const SizedBox(width: 20, height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                      MaterialPageRoute(
                        builder: (context) => Timetable(studentsEmail: userEmail,),
                      ));
                  },
                    child: const Icon(Icons.table_view_sharp, semanticLabel: "Timetable",),
                  ),
                const SizedBox(width: 20, height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(studentsEmail: userEmail,),
                        ));
                  },
                  child: const Icon(Icons.sticky_note_2, semanticLabel: "Result",),
                ),
                const SizedBox(width: 20, height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Memo(),
                        ));
                  },
                  child: const Icon(Icons.mark_email_unread_outlined, semanticLabel: "memo",),
                ),
                const SizedBox(width: 20, height: 20,),
                user == null ? SizedBox():
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(studentsEmail: userEmail,),
                        ));
                  },
                  child: const Icon(Icons.info, semanticLabel: "user profile",),
                ),
              ],
            ),
            //end of elevated btn
          ),
              SizedBox(height: 10,),
              Positioned(
              top: 180,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20,),
                  height: MediaQuery.of(context).size.height - 288,
                  width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
              ),
                  child: Container(
                    child: ListView(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "HIGHLIGHTED",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              //for e-pat
                            Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(12),
                              height: 160,
                              width: 140,
                              decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(
                                "Upcoming Dateline",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                                ),
                                SizedBox(
                                height: 8,
                                ),
                              Row(
                                children: [
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                    color: Colors.black,
                                     borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  SizedBox(
                                  width: 5,
                                  ),
                                  Text(
                                  "31st January 2022",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                     ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                    'UMP E-Pat evaluation',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),

                                ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 15),
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Deadline(studentsEmail: userEmail,),
                                  ));
                                },
                                child: const Text('View More..'),
                              ),
                              ],
                              ),
                              ),
                              //for fees - std ledger
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.all(12),
                                height: 160,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Current Fees",
                                      style: TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Balance",
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'RM 0.00',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(fontSize: 15),
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Fees(studentsEmail: userEmail,),
                                        ));
                                      },
                                      child: const Text('View More..'),
                                    ),
                                  ],
                                ),
                              ),
                              //for merit/demerit
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.all(12),
                                height: 160,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Merit/Demerit",
                                      style: TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Overall Activity",
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Total : 9000',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(fontSize: 15),
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Merit(studentsEmail: userEmail,),
                                        ));
                                      },
                                      child: const Text('View More..'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

       ],
    ),
        backgroundColor: Colors.cyanAccent,
      ),
      ),
    ],
    );
  }

  // Row buildTitleRow(String title) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       RichText(
  //         text: TextSpan(
  //             text: "HIGHLIGHTED",
  //             style: TextStyle(
  //                 fontSize: 12,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold),
  //             ),
  //       ),
  //
  //     ],
  //   );
  // }
  //
  // Container buildTaskItem(int numDays, String Title, Color color) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 15),
  //     padding: EdgeInsets.all(12),
  //     height: 140,
  //     width: 140,
  //     decoration: BoxDecoration(
  //       color: color.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //         Text(
  //           "Deadline",
  //           style: TextStyle(fontSize: 10, color: Colors.grey),
  //         ),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         Row(
  //           children: [
  //             Container(
  //               height: 6,
  //               width: 6,
  //               decoration: BoxDecoration(
  //                 color: color,
  //                 borderRadius: BorderRadius.circular(3),
  //               ),
  //             ),
  //             SizedBox(
  //               width: 5,
  //             ),
  //             Text(
  //               "$numDays days left",
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Container(
  //           width: 100,
  //           child: Text(
  //             Title,
  //             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

}