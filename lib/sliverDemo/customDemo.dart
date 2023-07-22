import 'package:flutter/material.dart';
class SliverDemo1 extends StatefulWidget {
  const SliverDemo1({Key? key}) : super(key: key);

  @override
  State<SliverDemo1> createState() => _SliverDemo1State();
}

class _SliverDemo1State extends State<SliverDemo1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: CustomScrollView(
          //floatHeaderSlivers: true,
            slivers: [
              SliverAppBar(
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.transparent,
                   expandedHeight: 333,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      height: 222,
                      color: Colors.black,
                    ),
                    background: Container(
                      height: 222,
                      color: Colors.brown,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(266),
                    child: Column(
                      children: [
                        Container(height: 44,color: Colors.green,width: 123,),
                        Container(
                          height: 222,
                          width: 333,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
              )
            ]

        ),
      ),
    );
  }
}
