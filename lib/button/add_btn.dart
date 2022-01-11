import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpsm/widget/post_form.dart';

class AddAnnouncementBtn extends StatefulWidget {
  @override
  _AddAnnouncementBtnState createState() => _AddAnnouncementBtnState();
}

class _AddAnnouncementBtnState extends State<AddAnnouncementBtn> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';


  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Announcement',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 6),
          PostFormWidget(
          onChangeTitle: (title) => setState(() =>this.title = title),
            onChangeDescription: (description) => setState(() =>this.description = description),
            onPostForm: () { },
          ),
        ],
      ),
    ),
  );
}