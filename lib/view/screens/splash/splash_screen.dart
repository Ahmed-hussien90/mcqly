import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: 250,
        splash: Image.asset(
          "assets/images/logo.png",
        ),
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.fadeTransition);
  }
}
