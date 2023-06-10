import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tweetapp/model/model.dart';
import 'package:tweetapp/view/utils/utils.dart';

final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

User user = FirebaseAuth.instance.currentUser!;

TextEditingController tweetController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

List<dynamic> myContents = [];

// Stream<List<DocumentSnapshot>> getData() async* {
//   try {
//     final ref = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.email)
//         .get();
//     if (ref.exists) {
//       final data = ref.data()!['tweet'];

//       myContents = data ?? ['no data'];
//       // myContents.reversed;
//       log('get data:::::::::${myContents}');

//       if (myContents.length > 1 && myContents[0] == 'no data') {
//         myContents.removeAt(0);
//       }
//     } else {
//       myContents = ['no data'];
//     }

//     yield [ref];
//   } catch (e) {
//     print(e);
//   }
// }

void updateFirebase() {
  Tweet obj = Tweet(tweet: myContents);
  obj.addToFirebase();
}

// void addTweetFun(BuildContext context, refresh) {
//   Content obj1 = Content(
//     content: tweetController.text,
//     date: DateTime.now(),
//   );
//   obj1.addTweets();
//   Tweet obj = Tweet(tweet: myContents);
//   obj.addToFirebase();
//   Fluttertoast.showToast(
//     msg: 'Tweeted ',
//     backgroundColor: blue,
//   );
//   Navigator.pop(context, 'refresh');
//   tweetController.clear();
//   refresh();
// }

// void editTweetFun(data, BuildContext context, refresh) {
//   data['content'] = tweetController.text;
//   data['date'] = data['date'];
//   Tweet obj = Tweet(tweet: myContents);
//   obj.addToFirebase();
//   Fluttertoast.showToast(
//     msg: 'Tweet edited',
//     backgroundColor: blue,
//   );
//   Navigator.pop(context, 'refresh');
//   Navigator.pop(context, 'refresh');

//   tweetController.clear();
//   refresh();
// }
