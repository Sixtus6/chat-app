import 'dart:async';
import 'package:chatapp/views/homepage/home_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  switchScreen(context) {
    Timer(const Duration(seconds: 3), () {
      const HomeScreenView().launch(context,
          pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true);
    });
  }
}
