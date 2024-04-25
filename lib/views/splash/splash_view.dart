import 'dart:async';

import 'package:chatapp/config/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => OrderSummaryPageViewModel(),
        builder: ((context, viewModel, child) => Scaffold()));
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   void flagSwitch(context) {
//     Timer(const Duration(seconds: 3), () {
//       // OnboardingScreen().launch(context,
//       //     pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     flagSwitch(context);
//     return Scaffold(
//       backgroundColor: ColorConfig.white,
//       body: Center(child: Lottie.asset("assets/lottie/splash.json")),
//     );
//   }
// }
