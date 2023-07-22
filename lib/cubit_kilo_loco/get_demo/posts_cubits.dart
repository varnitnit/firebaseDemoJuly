import 'package:firebase_demo/cubit_kilo_loco/get_demo/data_service.dart';
import 'package:firebase_demo/cubit_kilo_loco/get_demo/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<PostModel>>{
  final _dataService=DataService();
  PostsCubit():super([]);

  void getPosts() async=>emit(await _dataService.getPosts());

}