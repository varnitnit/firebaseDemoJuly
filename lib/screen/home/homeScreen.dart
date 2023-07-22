import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/api/api.dart';
import 'package:firebase_demo/model/chatUser.dart';
import 'package:firebase_demo/screen/profile/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widgets/chatUserCard.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ChatUser> list=[];
  @override
  void initState() {
    APIs.getSelfInfo();
    debugPrint("Class== $runtimeType");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: const [
            Text(
                "home after login"),

          ],
        ),
        actions: [
          //search user button
         /* IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
              icon: Icon(_isSearching
                  ? CupertinoIcons.clear_circled_solid
                  : Icons.search)),*/

          //more features button

          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProfileScreen(user: APIs.me)));
              },
              icon: const Icon(Icons.person,color: Colors.black,))
        ],

      ),
      body: StreamBuilder(
        stream: APIs.firestore.collection('users').snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){

/*
            for(var i in data!) {
            //  debugPrint("data== ${i.data()}");
              list.add(i.data()['name']);
            }*/

          switch (snapshot.connectionState){
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator(),);
            case ConnectionState.active:
            case ConnectionState.done:
            final data=snapshot.data?.docs;
            debugPrint("dataLength== ${data?.length}");
            list =data?.map((e) => ChatUser.fromJson(e.data())).toList()??[];

          }


          }
          if(list.isNotEmpty){
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,index){
                return ChatUserCard(user:list[index]);
              },
            );
          }
          else {
            return const Center(
              child: Text(
                  "No data found"
              ),
            );
          }
        },
      )
    );
  }


}
