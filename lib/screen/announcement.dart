import 'package:flutter/material.dart';
import 'package:testpsm/button/add_btn.dart';

class Announcement extends StatelessWidget {
  const Announcement({Key? key}) : super(key: key);

  static const String _title = 'Announcement page';

  @override
  Widget build(BuildContext context){
    final tabs = [
      Container(),
      Container(),
    ];

  return Scaffold(
    floatingActionButton: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //SizedBox(width: 5),
        FloatingActionButton(
          heroTag: 'add',
          onPressed: () => showDialog(
              builder: (context) => AddAnnouncementBtn(), context: context,
              //builder: (BuildContext context) {  },
              ),
          child: const Icon(Icons.add),
        ),
      ],
    ),
    );
  }
}