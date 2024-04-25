import 'package:chatapp/config/size.dart';
import 'package:chatapp/views/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeClass.mainTheme,
      home: SplashScreen(),
    );
  }
}
