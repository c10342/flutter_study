import 'package:flutter/material.dart';

enum ActiveType { Show, Hide }

typedef UpdateCallback = Function(int activeIndex, ActiveType type);

// 跨组件层级通信
class UpdateProvider extends InheritedWidget {
  final Function(UpdateCallback cb) addUpdateCallback;
  final Function(UpdateCallback cb) removeUpdateCallback;

  const UpdateProvider(
      {super.key,
      required super.child,
      required this.addUpdateCallback,
      required this.removeUpdateCallback});

//  该方法用于检查是否需要重新构建依赖InheritedWidget的子树
  @override
  bool updateShouldNotify(covariant UpdateProvider oldWidget) {
    return addUpdateCallback != oldWidget.addUpdateCallback ||
        removeUpdateCallback != oldWidget.removeUpdateCallback;
  }

  // 静态方法，允许子树中的任何位置获取UpdateProvider
  static UpdateProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UpdateProvider>();
  }
}

mixin UpdateProviderMixin<T extends StatefulWidget> on State<T> {
  @protected
  void update(int activeIndex, ActiveType type);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    UpdateProvider? updateProvider = UpdateProvider.of(context);
    if (updateProvider != null) {
      updateProvider.addUpdateCallback(update);
    }
  }

  @override
  void dispose() {
    UpdateProvider? updateProvider = UpdateProvider.of(context);
    if (updateProvider != null) {
      updateProvider.removeUpdateCallback(update);
    }
    super.dispose();
  }
}
