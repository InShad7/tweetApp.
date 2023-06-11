import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tweetapp/controller/controller.dart';
import 'package:tweetapp/model/model.dart';
import 'package:tweetapp/view/utils/utils.dart';

class TweetProvider extends ChangeNotifier {
  TextEditingController tweetController = TextEditingController();

  Stream<List<DocumentSnapshot>> getData() async* {
    // log('inside get data');
    try {
      final ref = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();
      if (ref.exists) {
        final data = ref.data()!['tweet'];

        myContents = data ?? ['no data'];

        if (myContents.length > 1 && myContents[0] == 'no data') {
          myContents.removeAt(0);
        }
      } else {
        myContents = ['no data'];
      }

      yield [ref];
    } catch (e) {
      print(e);
    }
  }

  void clearTweetController() {
    tweetController.clear();
    notifyListeners();
  }

  void addTweet(BuildContext context) {
    if (tweetController.text.isNotEmpty) {
      Content obj1 = Content(
        content: tweetController.text,
        date: DateTime.now(),
      );
      obj1.addTweets();

      Tweet obj = Tweet(tweet: myContents);
      obj.addToFirebase();

      Fluttertoast.showToast(
        msg: 'Tweeted ',
        backgroundColor: blue,
        gravity: ToastGravity.BOTTOM,
      );

      Navigator.pop(context);
      clearTweetController();
      getData();
    } else {
      Fluttertoast.showToast(
        msg: 'tweet cant be blank ',
        backgroundColor: deleteRed,
        gravity: ToastGravity.BOTTOM,
      );
    }
    // notifyListeners();
  }

  void editTweet(BuildContext context, data) {
    if (tweetController.text.isNotEmpty) {
      data['content'] = tweetController.text;
      data['date'] = data['date'];

      Tweet obj = Tweet(tweet: myContents);
      obj.addToFirebase();

      Fluttertoast.showToast(
        msg: 'Tweet edited',
        backgroundColor: blue,
        gravity: ToastGravity.BOTTOM,
      );

      Navigator.pop(context, 'refresh');
      Navigator.pop(context);
      clearTweetController();
      getData();
    } else {
      Fluttertoast.showToast(
        msg: 'tweet cant be blank ',
        backgroundColor: deleteRed,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void deleteTweet(int index) {
    myContents.removeAt(index);

    Fluttertoast.showToast(
      msg: 'deleted',
      backgroundColor: deleteRed,
      gravity: ToastGravity.BOTTOM,
    );

    Tweet obj = Tweet(tweet: myContents);
    obj.addToFirebase();
    getData();

    notifyListeners();
  }
}
