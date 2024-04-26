import 'package:chatapp/config/color.dart';
import 'package:chatapp/config/size.dart';
import 'package:chatapp/utils/style.dart';
import 'package:chatapp/views/homepage/home_viewmodel.dart';
import 'package:chatapp/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorConfig.primary, // Change the status bar color
      statusBarIconBrightness:
          Brightness.light, // Change the status bar icons' color
      systemNavigationBarColor:
          ColorConfig.white, // Change the navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.light, // Change the navigation bar icons' color
    ));
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: ((context, viewModel, child) => Scaffold(
              backgroundColor: ColorConfig.primary,
              body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
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
                    )
                  ],
                )),
              ),
            )));
  }
}
