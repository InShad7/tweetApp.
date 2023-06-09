import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tweetapp/controller/controller.dart';
import 'package:tweetapp/model/model.dart';
import 'package:tweetapp/view/home_screen/widget/alert.dart';
import 'package:tweetapp/view/home_screen/widget/drawer.dart';
import 'package:tweetapp/view/home_screen/widget/add_tweet.dart';
import 'package:tweetapp/view/home_screen/widget/option_list.dart';
import 'package:tweetapp/view/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void refresh() {
    setState(() {});
  }

  void deleteTweet(int index) {
    setState(() {
      myContents.removeAt(index);
      // Fluttertoast.showToast(
      //   msg: 'deleted',
      //   backgroundColor: deleteRed,
      // );
      log('qqqqqqqq${myContents}');
      Tweet obj = Tweet(tweet: myContents);
      obj.addToFirebase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeKey,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            homeKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.person, color: blue),
        ),
        title: Image.asset(
          'assets/twitter_logo.jpg',
          scale: 20,
        ),
      ),
      drawer: const NavigationDrawers(),
      body: StreamBuilder<List<DocumentSnapshot>>(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                  colors: [blue],
                  strokeWidth: 1,
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            // final data = snapshot.data!;
            myContents.sort((a, b) {
              return b['date'].compareTo(a['date']);
            });
            Tweet obj = Tweet(tweet: myContents);
            obj.addToFirebase();

            log('homeeeeeeeeeeeeeee::::::::::${myContents}');

            return (myContents.isEmpty || myContents[0] == 'no data')
                ? Text('No data')
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: myContents.length,
                    itemBuilder: (context, index) {
                      final tweet = myContents[index];
                      final formattedDate = DateFormat('MMMM d, yyyy hh:mm a')
                          .format(tweet['date'].toDate());

                      return Container(
                        padding: const EdgeInsets.all(15),
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 5),
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
                                        deleteTweet: deleteTweet,
                                        refresh: refresh,
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
                    },
                  );
          } else if (snapshot.hasError) {
            return const Text('Error fetching data');
          } else {
            return const Text('No data available');
          }
        },
      ),
      floatingActionButton: AddTweet(refresh: refresh),
    );
  }
}
