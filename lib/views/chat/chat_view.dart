import 'package:chatapp/config/color.dart';
import 'package:chatapp/views/chat/chat_viewmodel.dart';
import 'package:chatapp/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({super.key, required this.group});
  final String group;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ChatScreenViewModel(),
        builder: ((context, viewModel, child) => Scaffold(
              appBar: AppBarWidget(title: group),
              backgroundColor: ColorConfig.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            )));
  }
}
