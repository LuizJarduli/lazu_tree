import 'dart:ui';

import 'package:flutter/material.dart';

/// Custom scroll behavior to support touch, mouse, and trackpad interactions
/// across all platforms, including web and desktop.
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
