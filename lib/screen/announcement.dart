import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpsm/button/add_btn.dart';
import 'package:testpsm/model/post.dart';
import 'package:testpsm/provider/posts.dart';
import 'package:testpsm/services/firebase_services.dart';
import 'package:testpsm/widget/post_list.dart';

class Announcement extends StatelessWidget {
  const Announcement({Key? key}) : super(key: key);

  static const String _title = 'Announcement page';

  @override
  Widget build(BuildContext context){
    final tabs = [
      PostListWidget(),
      Container(),
    ];

    return Scaffold(
      body: StreamBuilder<List<Post>>(
        stream: FirebaseApi.readPosts(),

        /// return a Stream<List<Post>>
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later \n${snapshot.error}');
              } else {
                final post = snapshot.data;

                final provider = Provider.of<PostsProvider>(context);
                provider.setPosts(post!);

                return tabs[0];
              }
          }
        },
      ),
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

Widget buildText(String text) => Center(
  child: Text(
    text,
    style: TextStyle(fontSize: 24, color: Colors.black),
  ),
);