import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:testpsm/model/post.dart';
import 'package:testpsm/utils.dart';
import 'package:testpsm/services/auth_services.dart';
import 'dart:convert';

class FirebaseApi {
  static Future<String> createPost(Post post) async {
    // count brape byk post document
    // if 10 and more, delete all keep 9,
    // add new one here
    final docPost = FirebaseFirestore.instance.collection('post').doc();
    post.id = docPost.id;
    await docPost.set(post.toJson());
    return docPost.id;
  }

  static Stream<List<Post>> readPosts() {
    Stream<List<Post>> data = FirebaseFirestore.instance
        .collection('post')
        .orderBy(PostField.createdTime, descending: true)
        .snapshots()
        .transform(Utils.transformer(Post.fromJson));
    return data;
  }

  static void readPosts2() async {
    var data = await FirebaseFirestore.instance
        .collection('post')
        .orderBy(PostField.createdTime, descending: true)
        .snapshots()
        .transform(Utils.transformer(Post.fromJson));

    print('data:${data}');
  }
    // data.docs.forEach((element) {
    //   print('element: ${element.data()}');
    // });

  //delete announcement
    static Future deletePost(Post post) async {
      final docPost = FirebaseFirestore.instance.collection('post').doc(post.id);

      await docPost.delete();
    }


  final CollectionReference NewsRef = FirebaseFirestore
      .instance
      .collection("news");

  final CollectionReference ContactRef = FirebaseFirestore
      .instance
      .collection("contact");

  final CollectionReference StaffRef = FirebaseFirestore
      .instance
      .collection("staff");

  final CollectionReference CalRef = FirebaseFirestore
      .instance
      .collection("cal");

  final CollectionReference RapidRef = FirebaseFirestore
      .instance
      .collection("rapid");

  final CollectionReference ResidentRef = FirebaseFirestore
      .instance
      .collection("resident");



  }
