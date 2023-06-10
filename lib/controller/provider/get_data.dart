// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tweetapp/controller/controller.dart';
// import 'package:tweetapp/model/model.dart';

// class GetTweetDataProvider extends ChangeNotifier {
//   // List<dynamic> myContents = [];


//   Stream<List<DocumentSnapshot>> getData() async* {
//     log('inside get data');
//     try {
//       final ref = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(FirebaseAuth.instance.currentUser!.email)
//           .get();
//       if (ref.exists) {
//         final data = ref.data()!['tweet'];

//         myContents = data ?? ['no data'];
//         // myContents.reversed;
//         // log('get data:::::::::${myContents}');

//         if (myContents.length > 1 && myContents[0] == 'no data') {
//           myContents.removeAt(0);
//         }
//       } else {
//         myContents = ['no data'];
//       }

//       yield [ref];
//     } catch (e) {
//       print(e);
//     }
//   }
// }
