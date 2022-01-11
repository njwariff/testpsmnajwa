import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testpsm/model/post.dart';
import 'package:testpsm/utils.dart';

class FirebaseApi {
  static Future<String> createPost(Post post) async {
    final docPost = FirebaseFirestore.instance.collection('post').doc();

    post.id = docPost.id;
    await docPost.set(post.toJson());

    return docPost.id;
  }



  //untuk  udate announcement==disable features
  //static Future updatePost(Post post) async {
  //final docPost = FirebaseFirestore.instance.collection('post').doc(post.id);
  //await docPost.update(post.toJson());
  //}

  //delete announcement
  static Future deletePost(Post post) async {
    final docPost = FirebaseFirestore.instance.collection('post').doc(post.id);

    await docPost.delete();
  }
}
