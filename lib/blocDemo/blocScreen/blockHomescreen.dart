import 'package:firebase_demo/blocDemo/blocScreen/productScreen.dart';
import 'package:flutter/material.dart';
class HomeScreenBloc extends StatefulWidget {
  const HomeScreenBloc({Key? key}) : super(key: key);

  @override
  State<HomeScreenBloc> createState() => _HomeScreenBlocState();
}

class _HomeScreenBlocState extends State<HomeScreenBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc home"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductScreen()));
          },
          child: Text("get product"),
        )
      ),
    );
  }

}
