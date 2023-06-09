import 'package:flutter/material.dart';
import 'package:tweetapp/view/home_screen/widget/alert.dart';
import 'package:tweetapp/view/utils/utils.dart';

Future<dynamic> optionList({context, index, refresh, deleteTweet}) {
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
              buildItem(context: context, title: 'Edit', option: 1),
              buildItem(
                context: context,
                title: 'Delete',
                index: index,
                refresh: refresh,
                deleteTweet: deleteTweet,
                option: 2,
              ),
              buildItem(context: context, title: 'Cancel', option: 3),
            ],
          ),
        );
      });
}

Widget buildItem({context, title, option, index, refresh, deleteTweet}) {
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
      } else if (option == 2) {
        alertBox(
          context: context,
          delete: true,
          index: index,
          refresh: refresh,
          deleteFun: deleteTweet,
        );
      } else {
        Navigator.pop(context);
      }
    },
  );
}
