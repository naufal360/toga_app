import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:toga_app/ui/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: 'assets/images/logo.png',
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
        nextScreen: const OnboardingScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
