import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:testpsm/model/post.dart';
//import 'package:testpsm/page/edit_todo_page.dart';
import 'package:testpsm/provider/posts.dart';
import 'package:testpsm/utils.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({
    required this.post,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      //actionPane: SlidableDrawerActionPane(),
      key: Key(post.id),
     // actions: [
        //IconSlideAction(
         // color: Colors.red,
          //caption: 'Delete',
          //onTap: () => deletePost(context, post),
          //icon: Icons.delete,
        //)
      //],
      child: buildPost(context),
    ),
  );

  Widget buildPost(BuildContext context) => GestureDetector(
    //onTap: () => editPost(context, post),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
                if (post.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      post.description,
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    ),
  );

  void deletePost(BuildContext context, Post post) {
    final provider = Provider.of<PostsProvider>(context, listen: false);
    provider.removePost(post);
  }

  //untuk edit annoucement
  //void editPost(BuildContext context, Post post) => Navigator.of(context).push(
    //MaterialPageRoute(
     // builder: (context) => EditPostPage(post: post),
    //),
  //);
}