import 'dart:convert';

import 'package:firebase_demo/cubit_kilo_loco/get_demo/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class DataService{
  final _baseUrl='https://jsonplaceholder.typicode.com/';

Future<List<PostModel>> getPosts() async{
  try{
    var apiUrl="posts";
    debugPrint("url: ${_baseUrl+apiUrl}");
    http.Response response=await http.get(Uri.parse(_baseUrl+apiUrl));
    if(response.statusCode<=201){
      final json=jsonDecode(response.body) as List;
      final posts=json.map((e) => PostModel.fromJson(e)).toList();
      return posts;
    }
    return <PostModel>[];
  } catch (e){
    debugPrint("$e");
    throw e;
  }
}


}