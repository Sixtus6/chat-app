import 'package:flutter/material.dart';

class CustomCircleAvater extends StatelessWidget {
  const CustomCircleAvater({
    super.key,
    required this.widget,
    required this.radius,
    required this.color,
  });
  final Widget widget;
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: widget,
    );
  }
}
