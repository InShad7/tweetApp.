import 'package:flutter/material.dart';
import 'package:tweetapp/model/model.dart';

final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

TextEditingController tweetController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

List<dynamic> myContents = [];

void updateFirebase() {
  Tweet obj = Tweet(tweet: myContents);
  obj.addToFirebase();
}

void sortByTime() {
  myContents.sort((a, b) {
    return b['date'].compareTo(a['date']);
  });
  updateFirebase();
}
