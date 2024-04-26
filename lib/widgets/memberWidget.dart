import 'package:chatapp/config/color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/style.dart';

class MembersWidget extends StatelessWidget {
  const MembersWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConfig.primary.withOpacity(0.6),
          ),
          child: const Icon(
            Icons.person,
            size: 25,
            color: Colors.white,
          ),
        ).paddingSymmetric(horizontal: 7),
        5.height,
        Text(
          text,
          style: titleStyle(context, false, size: 15, color: Colors.black87),
        ),
      ],
    );
  }
}
