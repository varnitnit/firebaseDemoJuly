import 'package:flutter/material.dart';
class SliverDemo extends StatefulWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  State<SliverDemo> createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: NestedScrollView(
          //floatHeaderSlivers: true,
          headerSliverBuilder: (context,innerBoxIsScrolled){
            return [
              SliverAppBar(
                pinned: true,
              floating: true,
             backgroundColor: Colors.white,
                 // expandedHeight: 124,
                   snap: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(266),
                child: Column(
                  children: [
                    Transform.rotate(
                        angle: 1,
                        child: Container(height: 44,color: Colors.green,width: 123,)),
                    Container(
                      height: 222,
                      width: 333,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )
            )
            ];
          },
          body: Container(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context,index){

              return Column(
                children: [
                  Container(height: 45,color: Colors.green,),
                  Container(height: 45,color: Colors.blueGrey,),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
