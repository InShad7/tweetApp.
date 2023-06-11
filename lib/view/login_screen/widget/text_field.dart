import 'package:flutter/material.dart';
import 'package:tweetapp/view/utils/utils.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.title,
      required this.icon,
      required this.myControler,
      required this.passChar,
      required this.ht,
      required this.border});
      String title;
  var myControler;
  IconData? icon;
  bool passChar;
  double ht;
  double border;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            height: ht,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(border),
              color: white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: passChar,
                controller: myControler,
                cursorColor: blue,
                style: TextStyle(color: black),
                decoration: InputDecoration(
                  prefixIcon: Icon(icon, size: 28, color: blue),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: title,
                  hintStyle: const TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
