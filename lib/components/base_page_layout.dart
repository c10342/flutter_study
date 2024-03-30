import 'package:flutter/material.dart';

class BasePageLayout extends StatelessWidget {
  final String title;
  final Widget? child;

  final Color? backgroundColor;
  const BasePageLayout(
      {super.key, required this.title, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(title),
        // 背景颜色：从 App 上下文中获取主题，使用主题中配置的颜色方案中的主要颜色
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: child,
    );
  }
}
