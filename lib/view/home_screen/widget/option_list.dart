import 'package:flutter/material.dart';
import 'package:tweetapp/view/home_screen/widget/alert.dart';
import 'package:tweetapp/view/home_screen/widget/edit_tweet.dart';
import 'package:tweetapp/view/utils/utils.dart';

Future<dynamic> optionList({context, index, deleteTweet, data}) {
  return showModalBottomSheet(
      backgroundColor: grey2,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: Column(
            children: [
              buildItem(
                context: context,
                title: 'Edit',
                data: data,
                option: 1,
              ),
              buildItem(
                context: context,
                title: 'Delete',
                index: index,
                deleteTweet: deleteTweet,
                option: 2,
              ),
              buildItem(context: context, title: 'Cancel', option: 3),
            ],
          ),
        );
      });
}

Widget buildItem({context, title, option, index, deleteTweet, data}) {
  return InkWell(
    child: ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: option == 3 ? red : black,
          ),
        ),
      ),
    ),
    onTap: () {
      if (option == 1) {
        editTweet(
          context: context,
          index: index,
          data: data,
        );
      } else if (option == 2) {
        alertBox(
          context: context,
          delete: true,
          index: index,
          deleteFun: deleteTweet,
        );
      } else {
        Navigator.pop(context);
      }
    },
  );
}
