import 'package:animations/animations.dart';
import 'package:chatapp/config/color.dart';
import 'package:chatapp/config/size.dart';
import 'package:chatapp/utils/style.dart';
import 'package:chatapp/views/chat/chat_view.dart';
import 'package:chatapp/views/homepage/home_viewmodel.dart';
import 'package:chatapp/widgets/appBar.dart';
import 'package:chatapp/widgets/messageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeScreenViewModel(),
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
                      child: Column(
                          children: List.generate(
                              5,
                              (index) => OpenContainer(
                                    transitionDuration: Duration(seconds: 3),
                                    closedBuilder: (BuildContext context,
                                            VoidCallback openContainer) =>
                                        GestureDetector(
                                      onTap: openContainer,
                                      child: MessageWidget(
                                        title: "Group $index",
                                      ),
                                    ).paddingSymmetric(
                                      horizontal:
                                          SizeConfigs.getPercentageWidth(6),
                                    ),
                                    openBuilder: (BuildContext context, _) =>
                                        ChatScreenView(
                                      group: "Group $index",
                                    ),
                                  ))).paddingTop(40),
                      // child: Card(),
                    )
                  ],
                )),
              ),
            )));
  }
}
