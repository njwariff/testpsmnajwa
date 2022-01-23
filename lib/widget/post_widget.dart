import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpsm/model/post.dart';
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
    child: buildPost(context),
  );

  Widget buildPost(BuildContext context) => GestureDetector(
    child: Container(
      color: Colors.grey,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
              Text(
              post.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
                  ),
                Text(post.createdTime.toString()),
                SizedBox(height: 10,),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.grey,
                //   ),
                //   onPressed: () => deletePost(context, post),
                //   child: const Icon(Icons.delete_rounded, semanticLabel: "delete",),),
                //Text(post.id),
              ],
            ),
          ),
      Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () => deletePost(context, post),
              child: const Icon(Icons.delete_rounded, semanticLabel: "delete",),),
      ]
    ),
    ],
    ),
    ),
  );


  void deletePost(BuildContext context, Post post) {
    final provider = Provider.of<PostsProvider>(context, listen: false);
    provider.removePost(post);
  }

}