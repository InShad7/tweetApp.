import 'package:flutter/material.dart';
import 'package:tweetapp/view/utils/utils.dart';



class MyTextField extends StatefulWidget {
  String title;
  var myControler;
  IconData? icon;
  bool passChar;
  double ht;
  double border;
  MyTextField(
      {super.key,
      required this.title,
      required this.icon,
      required this.myControler,
      required this.passChar,
      required this.ht,
      required this.border});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            height: widget.ht,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.border),
              color: white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: widget.passChar,
                controller: widget.myControler,
                cursorColor: blue,
                style: TextStyle(color: black),

                decoration: InputDecoration(
                  prefixIcon: Icon(widget.icon, size: 28, color: blue),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: widget.title,
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
