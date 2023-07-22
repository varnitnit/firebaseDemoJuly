import 'package:flutter/material.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc home"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context,index){
            return Text("data");
          },
        ),
      ),
    );
  }
}
