
import 'package:flutter/material.dart';
import 'package:tweetapp/controller/controller.dart';
import 'package:tweetapp/model/model.dart';
import 'package:tweetapp/view/utils/utils.dart';

class AddTweet extends StatefulWidget {
  const AddTweet({super.key, this.refresh});
  final refresh;

  @override
  State<AddTweet> createState() => _AddTweetState();
}

class _AddTweetState extends State<AddTweet> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
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
                          Navigator.pop(context);
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
                          Content obj1 = Content(
                            content: tweetController.text,
                            date: DateTime.now(),
                          );
                          obj1.addTweets();

                          Tweet obj = Tweet(tweet: myContents);
                          obj.addToFirebase();
                          Navigator.pop(context, 'refresh');
                          tweetController.clear();
                        },
                        child: const Text(
                          'Tweet',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return TextFormField(
                          autofocus: true,
                          cursorColor: Colors.black,
                          controller: tweetController,
                          maxLines: null,
                          maxLength: 280,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: 'What\'s happening?',
                            hintStyle: TextStyle(color: grey, fontSize: 18),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: black, fontSize: 18),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        );
        if (result == 'refresh') {
          widget.refresh();
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
