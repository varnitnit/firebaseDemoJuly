
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/cubitDemo/cubit/app_cubits.dart';
import 'package:firebase_demo/model/chatUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CubitHome extends StatefulWidget {
 
  const CubitHome({Key? key,}) : super(key: key);

  @override
  State<CubitHome> createState() => _CubitHomeState();
}

class _CubitHomeState extends State<CubitHome> {

  @override
  void initState() {
    debugPrint("class: $runtimeType");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
 
    return Column(
      children: [
        ElevatedButton(

        onPressed: (){
          /// access field using bloc provider
          BlocProvider.of<AppCubits>(context).getData();
        }
        , child: Text("access data")),
        ListTile(
          leading: Container(
            width: width*.15,
            height: width*.15,

            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey.shade300,
                border: Border.all(color: Colors.black)
            ),

          ),
          title: Text(
              "heloo"
          ),
          subtitle: Text("heloo2"),
          trailing: Text("heloo3"),
        ),
      ],
    );
  }
}
