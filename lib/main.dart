import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweetapp/controller/provider/get_data.dart';
import 'package:tweetapp/controller/provider/tweet_provider.dart';
import 'package:tweetapp/view/splash_screen.dart/spalsh_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TweetProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => GetTweetDataProvider(),
        // )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
