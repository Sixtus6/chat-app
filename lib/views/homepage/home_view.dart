import 'package:animations/animations.dart';
import 'package:chatapp/config/color.dart';
import 'package:chatapp/config/size.dart';
import 'package:chatapp/model/chatmesage.model.dart';
import 'package:chatapp/model/chatroom.model.dart';
import 'package:chatapp/services/api/api_client.dart';
import 'package:chatapp/services/api/end_point.dart';
import 'package:chatapp/utils/style.dart';
import 'package:chatapp/views/chat/chat_view.dart';
import 'package:chatapp/views/homepage/home_viewmodel.dart';
import 'package:chatapp/widgets/appBar.dart';
import 'package:chatapp/widgets/messageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorConfig.primary,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: ColorConfig.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        onViewModelReady: (viewModel) => viewModel.getMessage(),
        builder: ((context, viewModel, child) => Scaffold(
              backgroundColor: ColorConfig.primary,
              body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    //Custom AppBar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_rounded,
                          color: ColorConfig.white,
                          size: 30,
                        ).expand(),
                        Text("Messages",
                                style: titleStyle(context, true, size: 20))
                            .onTap(() async {})
                            .paddingSymmetric(
                                horizontal: SizeConfigs.getPercentageWidth(6),
                                vertical: SizeConfigs.getPercentageHeight(2)),
                        Icon(
                          Icons.notifications,
                          color: ColorConfig.white,
                          size: 30,
                        ).expand(),
                      ],
                    ),
                    20.height,
                    Container(
                        decoration: BoxDecoration(
                          color: ColorConfig.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        height: SizeConfigs.screenHeight,
                        width: double.infinity,
                        child: viewModel.isBusy
                            ? SpinKitWave(
                                size: 20,
                                color: ColorConfig.primary,
                              ).paddingBottom(
                                SizeConfigs.getPercentageHeight(30))
                            : Column(
                                children: [
                                  Column(
                                      children: List.generate(
                                          viewModel.chatRooms.length,
                                          (index) => OpenContainer(
                                                transitionDuration:
                                                    const Duration(seconds: 3),
                                                closedBuilder: (BuildContext
                                                            context,
                                                        VoidCallback
                                                            openContainer) =>
                                                    GestureDetector(
                                                  onTap: openContainer,
                                                  child: MessageWidget(
                                                    title: viewModel
                                                        .capitalizeFirstLetter(viewModel
                                                                    .chatRooms[
                                                                        index]
                                                                    .topic
                                                                    .toLowerCase() ==
                                                                "n/a"
                                                            ? "unknown"
                                                            : viewModel
                                                                .chatRooms[
                                                                    index]
                                                                .topic),
                                                    message: viewModel
                                                        .capitalizeFirstLetter(
                                                            viewModel
                                                                .chatRooms[
                                                                    index]
                                                                .lastMessage),
                                                    counter: viewModel
                                                        .chatRooms[index]
                                                        .members
                                                        .length
                                                        .toString(),
                                                  ),
                                                ).paddingSymmetric(
                                                  horizontal: SizeConfigs
                                                      .getPercentageWidth(6),
                                                ),
                                                openBuilder: (BuildContext
                                                            context,
                                                        _) =>
                                                    ChatScreenView(
                                                        group: viewModel
                                                            .capitalizeFirstLetter(viewModel
                                                                        .chatRooms[
                                                                            index]
                                                                        .topic
                                                                        .toLowerCase() ==
                                                                    "n/a"
                                                                ? "unknown"
                                                                : viewModel
                                                                    .chatRooms[
                                                                        index]
                                                                    .topic)),
                                              ))).paddingTop(40),
                                ],
                              )
                        // child: Card(),
                        )
                  ],
                )),
              ),
            )));
  }
}
