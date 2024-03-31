import 'package:flutter/material.dart';

class BaseLoading {
  static void show(BuildContext context) {
    showDialog(
        context: context,
        // 遮罩层背景色
        // barrierColor: Colors.transparent,
        // 点击遮罩层是否关闭弹框
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            // 占满父容器
            constraints: const BoxConstraints.expand(),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  static void close(BuildContext context) {
    Navigator.pop(context);
  }
}
