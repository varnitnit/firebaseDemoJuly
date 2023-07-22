
import 'package:firebase_demo/cubitDemo/cubit/app_cubits_states.dart';
import 'package:firebase_demo/screen/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../searchScreen/view/multiselectdropdown_screen.dart';
import '../views/screens/cubit_home.dart';
import 'app_cubits.dart';

/// this files hold states and checks on the states

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  void initState() {
   debugPrint("class: $runtimeType");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (BuildContext context, state) {
          if(state is WelcomeState){
            debugPrint("WelcomeState:");
            return const CubitHome();
          }
          if(state is LoadingState){
            debugPrint("LoadingState:");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is LoadedState){
            debugPrint("LoadedState:");
            return MultiSelectDropDownScreen();
          }
          else{
            return Container();
          }
        },

      ),
    );
  }
}
