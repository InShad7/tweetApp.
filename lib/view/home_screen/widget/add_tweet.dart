import 'package:flutter/material.dart';
import 'package:tweetapp/view/home_screen/widget/edit_tweet.dart';

class AddTweet extends StatelessWidget {
  const AddTweet({super.key, this.index, this.data, this.edit = false});

  final index;
  final data;
  final edit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await editTweet(
          context: context,
          add: true,
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
