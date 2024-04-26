import 'package:chatapp/config/color.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
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
