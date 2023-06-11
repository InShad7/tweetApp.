import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweetapp/controller/provider/tweet_provider.dart';
import 'package:tweetapp/view/utils/utils.dart';

Future editTweet({context, index, data, add = false}) async {
  if (add) {
    Provider.of<TweetProvider>(context, listen: false).clearTweetController();
  }
  if (add == false) {
    Provider.of<TweetProvider>(context, listen: false).tweetController.text =
        data['content'];
  }
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Consumer<TweetProvider>(
        builder: (BuildContext context, tweetModel, _) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: white,
            child: Column(
              children: [
                kHeight30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (add) {
                          Navigator.pop(context);
                          tweetModel.clearTweetController();
                        } else {
                          tweetModel.clearTweetController();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.close),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                      ),
                      onPressed: () {
                        add
                            ? tweetModel.addTweet(context)
                            : tweetModel.editTweet(context, data);
                      },
                      child: const Text(
                        'Tweet',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: TextFormField(
                    autofocus: true,
                    cursorColor: Colors.black,
                    controller: tweetModel.tweetController,
                    maxLines: null,
                    maxLength: 280,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'What\'s happening?',
                      hintStyle: TextStyle(color: grey, fontSize: 18),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: black, fontSize: 18),
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}
