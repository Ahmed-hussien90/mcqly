import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: 250,
        backgroundColor: Colors.transparent,
        splash: Image.asset(
          "assets/images/hhhh.png",
        ),
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.fadeTransition);
  }
}
