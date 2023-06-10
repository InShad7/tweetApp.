import 'package:flutter/material.dart';
import 'package:tweetapp/controller/controller.dart';
import 'package:tweetapp/view/home_screen/widget/alert.dart';
import 'package:tweetapp/view/utils/utils.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(children: [
          buildHeader(context),
          buildMenuItems(context),
        ]),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.blue.shade700,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, bottom: 24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage('assets/dp.jpg'),
            ),
            kHeight,
            Text(
              user.displayName!,
              style: TextStyle(fontSize: 20, color: white),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                alertBox(context: context);
              },
            ),
          ],
        ),
      );
}
