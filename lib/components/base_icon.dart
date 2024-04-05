import 'package:flutter/material.dart';

class BaseIcon extends StatelessWidget {
  final int codePoint;
  final Color? color;
  const BaseIcon({super.key, required this.codePoint, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(codePoint, fontFamily: 'BaseIcon'),
      color: color,
    );
  }
}
