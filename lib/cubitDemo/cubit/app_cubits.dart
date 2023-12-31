import 'package:bloc/bloc.dart';
import 'package:firebase_demo/cubitDemo/cubit/app_cubits_states.dart';
import 'package:firebase_demo/cubitDemo/services/data_services.dart';
class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}):super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
void getData()async{
    try{
      emit(LoadingState());
      places=await data.getInfo();
      emit(LoadedState(places));
    }catch (e){
      print("$e");
    }
}
}