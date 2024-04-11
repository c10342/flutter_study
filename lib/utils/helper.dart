import 'package:flutter/material.dart';

class CommonUtils {
  static T? findItemByList<T>(List<T> list, bool Function(T element) cb) {
    try {
      return list.firstWhere(cb);
    } catch (e) {
      return null;
    }
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
