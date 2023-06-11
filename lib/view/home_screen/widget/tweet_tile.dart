import 'package:flutter/material.dart';
import 'package:tweetapp/view/home_screen/widget/option_list.dart';
import 'package:tweetapp/view/utils/utils.dart';

class TweetItemTile extends StatelessWidget {
  const TweetItemTile({super.key, this.tweet, this.index, this.formattedDate});
  final tweet;
  final index;
  final formattedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 5),
      width: MediaQuery.of(context).size.width,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  child: Text(
                    tweet['content'],
                    style: TextStyle(
                      fontSize: 18,
                      color: black,
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    optionList(
                      context: context,
                      index: index,
                      data: tweet,
                    );
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: grey,
                  ))
            ],
          ),
          kHeight20,
          Text(
            formattedDate.toString(),
            style: TextStyle(
              fontSize: 13,
              color: grey,
            ),
          ),
        ],
      ),
    );
  }
}
