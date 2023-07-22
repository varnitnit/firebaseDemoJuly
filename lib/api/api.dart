import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/model/chatUser.dart';
import 'package:flutter/material.dart';
class APIs{

  // for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  //static FirebaseStorage storage = FirebaseStorage.instance;
  // to return current user
  static User get user => auth.currentUser!;

  // for checking if user exists or not?
  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }
// for store self data
  static late ChatUser me;
  // for getting current user info
  static Future<void> getSelfInfo() async {
    await firestore.collection('users').doc(user.uid).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
       // await getFirebaseMessagingToken();

        //for setting user status to active
       // APIs.updateActiveStatus(true);
        debugPrint('My Data: ${user.data()}');
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  // for creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUser(
        id: user.uid,
        name: user.displayName.toString(),
        email: user.email.toString(),
        about: "Hey, I'm using We Chat!",
        image: user.photoURL.toString(),
        createdAt: time,
        isOnline: false,
        lastActive: time,
        pushToken: '');

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }



  // for getting all users from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(
      List<String> userIds) {
    debugPrint('\nUserIds: $userIds');

    return firestore
        .collection('users')
        /*.where('id',
        whereIn: userIds.isEmpty
            ? ['']
            : userIds) *///because empty list throws an error
     .where('id', isNotEqualTo: user.uid)  // current user data not show
        .snapshots();
  }
}

