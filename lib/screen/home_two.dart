import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testpsm/services/auth_services.dart';

class HomeTwo extends StatelessWidget {
  const HomeTwo({Key? key}) : super(key: key);
  static const String _title = 'HomePage Two';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
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
    return Scaffold(
      //TITTLE BLUE BIG
      //appBar: AppBar(
      //title: const Text('UMP Intel', textAlign: TextAlign.center,),
      //),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(50)),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  _auth.signOut();
                },
                child: Text('logout'),
              ),
            ),
            Container(
              child: (user == null) ? Text('Home Two User:not logged in') : Text('Home Two Email:${user!.email}'),
            ),
          ],
        ),
      ),
    );
  }
}