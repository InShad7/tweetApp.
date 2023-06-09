import 'package:flutter/material.dart';
import 'package:tweetapp/controller/controller.dart';
import 'package:tweetapp/view/login_screen/widget/login_btn.dart';
import 'package:tweetapp/view/login_screen/widget/main_card.dart';
import 'package:tweetapp/view/login_screen/widget/signup_btn.dart';
import 'package:tweetapp/view/login_screen/widget/text_field.dart';
import 'package:tweetapp/view/signup_screen/signup_screen.dart';
import 'package:tweetapp/view/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        const SignInText(title: 'Sign In'),
        kHeight20,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Email',
          icon: Icons.mail,
          myControler: userNameController,
          passChar: false,
        ),
        kHeight,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Password',
          icon: Icons.lock,
          myControler: passwordController,
          passChar: true,
        ),
        kHeight30,
        const LoginBtn(),
        kHeight30,
        SignUpTxtBtn(navigateTo: SignUpScreen()),
        kHeight60,
      ]),
    );
  }
}
