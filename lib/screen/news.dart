import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  static const String _title = 'HomePage One';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,

    );
  }
}