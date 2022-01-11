import 'package:flutter/material.dart';
import 'package:testpsm/screen/announcement.dart';
import 'package:testpsm/screen/news.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({Key? key}) : super(key: key);

  static const String _title = 'Announcement and Event Page Navigation';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("ANNOUNCEMENT"),
              ),
              Tab(
                child: Text("NEWS"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Announcement(),
            News(),
          ],
        ),
      ),
    );
  }
}