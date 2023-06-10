
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tweetapp/controller/controller.dart';
import 'package:tweetapp/controller/provider/tweet_provider.dart';
import 'package:tweetapp/view/home_screen/widget/drawer.dart';
import 'package:tweetapp/view/home_screen/widget/add_tweet.dart';
import 'package:tweetapp/view/home_screen/widget/tweet_tile.dart';
import 'package:tweetapp/view/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tweetProvider = Provider.of<TweetProvider>(context);
    return Scaffold(
      backgroundColor:
          (myContents.isEmpty || myContents[0] == 'no data') ? white : null,
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
        stream: tweetProvider.getData(),
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
            myContents.sort((a, b) {
              return b['date'].compareTo(a['date']);
            });
            updateFirebase();
            return Consumer<TweetProvider>(builder: (context, value, child) {
              return (myContents.isEmpty || myContents[0] == 'no data')
                  ? Center(child: Image.asset('assets/nodata.jpg'))
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: myContents.length,
                      itemBuilder: (context, index) {
                        final tweet = myContents[index];
                        final formattedDate = DateFormat('MMMM d, yyyy hh:mm a')
                            .format(tweet['date'].toDate());

                        return TweetItemTile(
                          tweet: tweet,
                          index: index,
                          formattedDate: formattedDate,
                          deleteTweet: value.deleteTweet,
                        );
                      },
                    );
            });
          } else if (snapshot.hasError) {
            return const Text('Error fetching data');
          } else {
            return const Text('No data available');
          }
        },
      ),
      floatingActionButton: AddTweet(),
    );
  }
}
