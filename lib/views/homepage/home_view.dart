import 'package:chatapp/config/color.dart';
import 'package:chatapp/views/homepage/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: ((context, viewModel, child) => Scaffold(
              backgroundColor: ColorConfig.white,
              appBar: AppBarWidget(),
              //body: Center(child: Lottie.asset("assets/lottie/splash.json")),
            )));
  }
}
