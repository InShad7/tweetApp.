
import 'package:flutter/material.dart';
import 'package:tweetapp/controller/controller.dart';
import 'package:tweetapp/view/utils/utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  final Size preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
