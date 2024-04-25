import 'dart:async';

import 'package:chatapp/config/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void flagSwitch(context) {
    Timer(const Duration(seconds: 3), () {
      // OnboardingScreen().launch(context,
      //     pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    flagSwitch(context);
    return Scaffold(
      backgroundColor: ColorConfig.splash,
      //  body: Center(child: Lottie.asset("assets/lottie/splash2.json")),
    );
  }
}
