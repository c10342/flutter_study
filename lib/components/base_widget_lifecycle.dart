import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BaseWidgetLifecycle extends StatelessWidget {
  final Widget child;
  final void Function()? onShow;
  final void Function()? onHide;
  const BaseWidgetLifecycle(
      {super.key, required this.child, this.onHide, this.onShow});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('BaseWidgetLifecycle-${Random().nextInt(1000)}'),
      child: child,
      onVisibilityChanged: (info) {
        var visiblePercentage = info.visibleFraction * 100;
        if (visiblePercentage == 100) {
          if (onShow != null) {
            onShow!();
          }
        } else if (visiblePercentage == 0) {
          if (onHide != null) {
            onHide!();
          }
        }
      },
    );
  }
}
