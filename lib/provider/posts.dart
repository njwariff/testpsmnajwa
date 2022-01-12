import 'package:flutter/cupertino.dart';
import 'package:testpsm/services/firebase_services.dart';
import 'package:testpsm/model/post.dart';

class PostsProvider extends ChangeNotifier {
  List<Post> _posts = [];

  //untuk mark post done
  //List<Post> get posts => posts.where((post) => post.isDone == false).toList();
  //List<Post> get postsCompleted =>
     // _posts.where((post) => post.isDone == true).toList();

  List<Post> get posts => _posts.toList();

  void setPosts(List<Post> posts) => WidgetsBinding.instance!.addPostFrameCallback((_) {
    //Future.delayed(const Duration(milliseconds: 5000), () {
    //print('posts:$posts');
        _posts = posts;
        notifyListeners();
      });

  void readPosts() => FirebaseApi.readPosts();

  void readPosts2() => FirebaseApi.readPosts2();

  void addPost(Post post) => FirebaseApi.createPost(post);

  void removePost(Post post) => FirebaseApi.deletePost(post);



}