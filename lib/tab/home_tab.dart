import 'package:flutter/material.dart';
import 'package:testpsm/button/staff_btn.dart';
import 'package:testpsm/button/contact_btn.dart';
import 'package:testpsm/button/calendar_btn.dart';
import 'package:testpsm/button/rapid_btn.dart';
import 'package:testpsm/button/resident_btn.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  static const String _title = '                        UMP InteL';

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
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 'staff dir',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StaffBtn(),
                  ));
            },
            child: const Icon(Icons.people_alt_rounded),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'student resident',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResidentBtn(),
                  ));
            },
            child: const Icon(Icons.apartment_rounded),
          ),
          const SizedBox(width: 10),
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
          const SizedBox(width: 10),
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
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'contact',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactBtn(),
                  ));
            },
            child: const Icon(Icons.call_sharp),
          ),
        ],
      ),

    );
  }
}
