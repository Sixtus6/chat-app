import 'package:chatapp/config/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: ((context, viewModel, child) => Scaffold(
              backgroundColor: ColorConfig.primary,
            )));
  }
}
