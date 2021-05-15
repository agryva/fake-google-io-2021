

import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final double size;
  final Color color;
  const CustomCircle({Key? key, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ));
  }
}
