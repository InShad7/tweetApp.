import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweetapp/controller/provider/tweet_provider.dart';
import 'package:tweetapp/view/utils/utils.dart';

void alertBox({context, delete = false, index,}) {
  showModalBottomSheet(
    backgroundColor: grey2,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18),
      ),
    ),
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        kHeight,
        SizedBox(
          width: 400,
          height: 70,
          child: TextButton(
            onPressed: () async {
              if (delete == true) {
                Provider.of<TweetProvider>(context, listen: false)
                    .deleteTweet(index);
                Navigator.pop(context);
                Navigator.pop(context);
              } else {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              }
            },
            child: Text(
              delete ? 'Delete' : 'Logout',
              style: TextStyle(color: teal, fontSize: 18),
            ),
          ),
        ),
        const Divider(indent: 60, endIndent: 60),
        SizedBox(
          height: 65,
          width: 400,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: red, fontSize: 18),
            ),
          ),
        ),
        kHeight,
      ],
    ),
  );
}
