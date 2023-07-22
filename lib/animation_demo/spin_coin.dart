import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SpinCoin extends StatefulWidget {
  const SpinCoin({Key? key}) : super(key: key);

  @override
  State<SpinCoin> createState() => _SpinCoinState();
}

class _SpinCoinState extends State<SpinCoin>with TickerProviderStateMixin  {
  bool isObscure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AnimationController animationController;
  late Animation<double> animation;

  String userId = "";
  String profileImage = "";
  bool isLoading=true;

  @override
  void initState() {
    debugPrint("Class : MyProfile");
    animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 411));
    animation=CurvedAnimation(parent: animationController, curve: Curves.easeIn,);
    animationController.repeat();


    // Stop the animation after 5 seconds
    timer = Timer(Duration(seconds: 5), () {
      animationController.stop();
    });
    super.initState();

  }

  late Timer timer;


  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(

        ),

        body: Container(
          height: size.height,
          width: double.infinity,
          decoration:  BoxDecoration(
              color: Colors.white,
            ),
          child: isLoading? Center(
              child: transitionBuilder(Icon(Icons.temple_buddhist), animationController)
          ):Container(
            width: 123,
            height: 123,color: Colors.red,
          ),
        ),
      )

    );
  }
  Widget transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (const ValueKey(true) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
