import 'package:chatapp/config/color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.arrow_back_ios_rounded,
        color: ColorConfig.primary,
        size: 26,
      ).onTap(() {
        finish(context);
      }),
      backgroundColor: ColorConfig.white,
      title: Text(
        title,
        style: TextStyle(color: ColorConfig.primary),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 40);
}
