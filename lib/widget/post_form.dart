import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpsm/model/post.dart';
import 'package:testpsm/provider/posts.dart';

import '../utils.dart';

class PostFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;
  final Function onPostForm;

  //constructor
  PostFormWidget({
    Key? key,
    this.title='',
    this.description='',
    required this.onChangeTitle,
    required this.onChangeDescription,
    required this.onPostForm,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 8),
        buildDescription(),
        SizedBox(height: 32),
        buildBtn(),
      ],
    ),
  );

  //for title field
  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    onChanged: onChangeTitle,

    //untuk wajibkan ada title
    validator: (title){
      if(title!.isEmpty){
        return 'Please put your title';
      }
      return null;
    },

    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title',
    ),
  );

  //for description field
  Widget buildDescription() => TextFormField(
    maxLines: 3,
    initialValue: description,
    onChanged: onChangeDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description',
    ),
  );

  //for POST button
  Widget buildBtn() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      child: Text('Post'),
      onPressed: () {
        print('aaa');
        onPostForm();
      },
    ),
  );

}

void deletePost(BuildContext context, Post post) {
  final provider = Provider.of<PostsProvider>(context, listen: false);
  provider.removePost(post);

  Utils.showSnackBar(context, 'Deleted the announcement');
}