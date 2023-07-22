import 'dart:convert';

import 'package:firebase_demo/cubitDemo/cubitModel/data_model.dart';
import 'package:http/http.dart' as http;
class DataServices{
  String baseUrl="http://mark.bslmeiyu.com/api";
   Future<List<DataModel>>  getInfo()async{
    var apiUrl="/getplaces";
    http.Response res=await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      /// flutter understand Map not json
      if(res.statusCode<=201){
        List<dynamic> list=json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
      return <DataModel>[];
    } on Exception catch(e){
      print ("$e");
      return <DataModel>[];
    }
  }
}