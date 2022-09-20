import 'package:belajar_flutter/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: AnimatedSplashScreen(
      backgroundColor: Colors.greenAccent,
      splash: Image.asset('./assets/images/logotext.png'),
      nextScreen: MyStatefulWidget(),
    ));
  }
}
