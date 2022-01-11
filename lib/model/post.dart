import 'package:flutter/cupertino.dart';
import 'package:testpsm/utils.dart';

class PostField {
  static const createdTime = 'createdTime';
}

class Post{
  //DateTime createdTime;
  String title;
  String id;
  String description;
  //bool isDone;

  Post({
    //required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    //this.isDone = false,
  });

  static Post fromJson(Map<String, dynamic> json) => Post(
    //createdTime: Utils.toDateTime(json['createdTime']),
    title: json['title'],
    description: json['description'],
    id: json['id'],
    //isDone: json['isDone'],
  );

  Map<String, dynamic> toJson() => {
    //'createdTime': Utils.fromDateTimeToJson(createdTime),
    'title': title,
    'description': description,
    'id': id,
    //'isDone': isDone,
  };
}