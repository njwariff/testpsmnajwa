import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/button/staff_btn.dart';
import 'package:testpsm/screen/profile.dart';
import 'package:testpsm/screen/result.dart';
import 'package:testpsm/screen/timetable.dart';
import 'package:testpsm/services/auth_services.dart';

import 'memo.dart';

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

    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onSecondary);
    return Container(
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
        // TextButton(
        // style: style,
        //   onPressed: () {},
        // child: const Icon(Icons.navigate_next,),
        // )
      ],
      // body: Center(
      //   child: Column(
      //     children: [
      //       Padding(padding: EdgeInsets.all(50)),
      //       Container(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             _auth.signOut();
      //           },
      //           child: Text('logout'),
      //         ),
      //       ),
      //       Container(
            //child: (user == null) ? Text('Home Two User:not logged in') : Text('Home Two Email:${user!.email}'),
      //       ),
      //     ],
      //   ),
      ),
      body: Row(
        children: [
          const SizedBox(width: 20, height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                MaterialPageRoute(
                  builder: (context) => TimeTable(),
                ));
            },
              child: const Icon(Icons.table_view_sharp, semanticLabel: "Timetable",),
            ),
          const SizedBox(width: 20, height: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(),
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => Profile(studentsId: '',),
                    builder: (context) => Memo(),
                  ));
            },
            child: const Icon(Icons.info, semanticLabel: "user profile",),
          ),
        ],
      ),
      backgroundColor: Colors.cyanAccent,
      ),
    );
  }
}