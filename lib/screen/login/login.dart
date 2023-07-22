import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/api/api.dart';
import 'package:firebase_demo/screen/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../searchScreen/view/multiselectdropdown_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: (){
                handleLogin();
          }, child: const Text(
            "Login with google"
          )),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MultiSelectDropDownScreen()));
              }, child: const Text(
              "search"
          ))
        ],
      ),
    );
  }

  handleLogin(){
    _signInWithGoogle().then((user) async {
      debugPrint("user: ${user.user}");
      debugPrint("user: ${user.additionalUserInfo}");

      if ((await APIs.userExists())) {
      Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
      await APIs.createUser().then((value) {
      Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      });
      }

    });
  }

  ///https://firebase.google.com/docs/auth/flutter/federated-auth
  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
