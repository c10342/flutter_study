import 'package:flutter/material.dart';

// 跨组件层级通信
class FormProvider extends InheritedWidget {
  final double? labelWidth;

  const FormProvider(
      {super.key, required super.child, required this.labelWidth});

//  该方法用于检查是否需要重新构建依赖InheritedWidget的子树
  @override
  bool updateShouldNotify(covariant FormProvider oldWidget) {
    return labelWidth != oldWidget.labelWidth;
  }

  // 静态方法，允许子树中的任何位置获取FormProvider
  static FormProvider? of(BuildContext? context) {
    if (context?.dependOnInheritedWidgetOfExactType != null) {
      return context!.dependOnInheritedWidgetOfExactType<FormProvider>();
    }
    return null;
  }
}
