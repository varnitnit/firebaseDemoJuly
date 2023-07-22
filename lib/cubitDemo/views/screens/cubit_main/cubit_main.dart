import 'package:firebase_demo/cubitDemo/cubit/app_cubits.dart';
import 'package:firebase_demo/cubitDemo/services/data_services.dart';
import 'package:firebase_demo/cubitDemo/views/screens/cubit_home.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/app_cubit_logics.dart';
class CubitMain extends StatefulWidget {
  const CubitMain({Key? key}) : super(key: key);

  @override
  State<CubitMain> createState() => _CubitMainState();
}

class _CubitMainState extends State<CubitMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("cubit main")),
      body:    Container(
        margin: EdgeInsets.all(20),
       /* child:    ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CubitHome()));
            }, child: const Text(
            "Cubit  "
        )),*/
        child: BlocProvider<AppCubits>(
          create:(context)=>AppCubits(data: DataServices()),
          child:const  AppCubitLogics(),
        ),
      )

    );
  }
}
