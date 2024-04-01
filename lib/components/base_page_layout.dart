import 'package:flutter/material.dart';

class BasePageLayout extends StatelessWidget {
  final String? title;
  final Widget? body;
  final Widget? header;
  final PreferredSizeWidget? headerBottom;
  final Widget? footer;
  final Widget? floating;
  final FloatingActionButtonLocation? floatingLocation;
  final List<Widget>? actions;
  final Color? headerBgColor;
  final Color? pageBgColor;

  const BasePageLayout(
      {super.key,
      this.title,
      this.body,
      this.headerBgColor,
      this.header,
      this.actions,
      this.pageBgColor,
      this.footer,
      this.headerBottom,
      this.floating,
      this.floatingLocation});

  PreferredSizeWidget? buildAppBar() {
    if (title != null ||
        header != null ||
        (actions != null && actions!.isNotEmpty)) {
      return AppBar(
        title: header ??
            (title != null
                ? Text(
                    title!,
                    style: const TextStyle(color: Colors.white),
                  )
                : null),
        bottom: headerBottom,
        actions: actions,
        backgroundColor: headerBgColor,
        iconTheme: const IconThemeData(color: Colors.white),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBgColor,
      appBar: buildAppBar(),
      body: body,
      bottomNavigationBar: footer,
      floatingActionButton: floating,
      floatingActionButtonLocation: floatingLocation,
    );
  }
}
