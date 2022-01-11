import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpsm/provider/posts.dart';
import 'package:testpsm/widget/post_widget.dart';

class PostListWidget extends StatelessWidget {
  var posts;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostsProvider>(context);
    //final posts = provider.posts;

    return posts.isEmpty
        ? Center(
      child: Text(
       'No Announcement.',
       style: TextStyle(fontSize: 20),
      ),
    )
        : ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostWidget(post: post);
      },
    );
  }
}