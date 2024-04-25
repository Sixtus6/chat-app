import 'dart:async';

import 'package:chatapp/config/color.dart';
import 'package:chatapp/views/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.switchScreen(context);
        },
        builder: ((context, viewModel, child) => Scaffold(
              backgroundColor: ColorConfig.white,
              body: Center(child: Lottie.asset("assets/lottie/splash.json")),
            )));
  }
}
