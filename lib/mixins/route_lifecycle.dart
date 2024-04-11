// 路由生命周期
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/routes.dart';

mixin RouteLifecycleMixin<T extends StatefulWidget> on State<T>, RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Routes.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    Routes.routeObserver.unsubscribe(this);
    super.dispose();
  }
}
