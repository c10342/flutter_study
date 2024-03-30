import 'package:flutter/material.dart';

class BaseTag extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? color;
  const BaseTag.origin({
    super.key,
    required this.title,
    this.backgroundColor = Colors.grey,
    this.color = Colors.black,
  });

// factory工厂构造函数
  factory BaseTag(String title) {
    switch (title) {
      case '近地铁':
        return BaseTag.origin(
            title: title, color: Colors.red, backgroundColor: Colors.red[50]);
      case '集中供暖':
        return BaseTag.origin(
            title: title, color: Colors.blue, backgroundColor: Colors.blue[50]);
      case '随时看房':
        return BaseTag.origin(
            title: title,
            color: Colors.green,
            backgroundColor: Colors.green[50]);
      case '新上':
        return BaseTag.origin(
            title: title, color: Colors.red, backgroundColor: Colors.red[50]);
      default:
        return BaseTag.origin(
          title: title,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.only(top: 2, left: 4, bottom: 2, right: 4),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8)),
      child: Text(
        title,
        style: TextStyle(fontSize: 10, color: color),
      ),
    );
  }
}
