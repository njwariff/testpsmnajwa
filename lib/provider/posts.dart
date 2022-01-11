import 'package:flutter/cupertino.dart';
import 'package:testpsm/services/firebase_services.dart';
import 'package:testpsm/model/post.dart';

class PostsProvider extends ChangeNotifier {
  List<Post> _posts = [];

  //untuk mark post done
  //List<Post> get posts => posts.where((post) => post.isDone == false).toList();
  //List<Post> get postsCompleted =>
      //_posts.where((post) => post.isDone == true).toList();

  void setPosts(List<Post> posts) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _posts = posts;
        notifyListeners();
      });

  void addPost(Post post) => FirebaseApi.createPost(post);

  void removePost(Post post) => FirebaseApi.deletePost(post);

  //bool togglePostStatus(Post post) {
    //post.isDone = !post.isDone;
   // FirebaseApi.updatePost(post);
    //return post.isDone;
  //}

  //for upadteannounncement
  //void updatePost(Post post, String title, String description) {
    //post.title = title;
   // post.description = description;

    //FirebaseApi.updatePost(post);
  //}

}