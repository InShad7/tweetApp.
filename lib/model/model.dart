import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tweetapp/controller/controller.dart';

class Tweet {
  dynamic tweet;

  Tweet({required this.tweet});

  Future<void> addToFirebase() async {
    try {
      final ref = FirebaseFirestore.instance.collection('users');
      final docRef = ref.doc(FirebaseAuth.instance.currentUser!.email);

      Map<String, dynamic> data() {
        return {
          'tweet': tweet,
        };
      }

      await docRef.set(data());
    } catch (e) {
      print(e);
    }
  }
}

class Content {
  String content;
  DateTime date;

  Content({required this.content, required this.date});

  Future<void> addTweets() async {
    Map<String, dynamic> data() {
      return {
        'content': content,
        'date': date,
      };
    }

    myContents.add(data());
    log(myContents.toString());
  }
}
