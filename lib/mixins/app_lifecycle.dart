import 'package:flutter/widgets.dart';

// App生命周期

mixin AppLifecycleMixin<T extends StatefulWidget> on State<T> {
  late final AppLifecycleListener listener;

  @override
  void initState() {
    super.initState();
    listener = AppLifecycleListener(
      onShow: onShow,
      onResume: onResume,
      onHide: onHide,
      onInactive: onInactive,
      onPause: onPause,
      onDetach: onDetach,
      onRestart: onRestart,
      onStateChange: onStateChange,
    );
  }

  void onStateChange(AppLifecycleState state) {}

  /// 可见，并且可以响应用户操作时的回调
  void onResume() {}

  /// 可见，但无法响应用户操作时的回调
  void onInactive() {}

  /// 隐藏时的回调
  void onHide() {}

  /// 显示时的回调。
  void onShow() {}

  /// 暂停时的回调
  void onPause() {}

  /// 暂停后恢复时的回调
  void onRestart() {}

  /// 这两个回调，不是所有平台都支持，

  /// 当退出 并将所有视图与引擎分离时的回调（IOS 支持，Android 不支持）
  void onDetach() {}

  @override
  void dispose() {
    listener.dispose();
    super.dispose();
  }
}
