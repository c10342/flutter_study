import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final String title;
  final Widget? child;
  const PageContent({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child,
    );
  }
}
