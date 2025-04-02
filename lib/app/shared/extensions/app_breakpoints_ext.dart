import 'package:flutter/material.dart';
import 'package:lazu_tree/app/shared/utils/app_breakpoints.dart';

extension AppBreakpointsExt on BoxConstraints {
  bool get isLarge =>
      maxWidth > AppBreakpoints.medium && maxWidth <= AppBreakpoints.large;

  bool get isMedium =>
      maxWidth > AppBreakpoints.small && maxWidth <= AppBreakpoints.medium;

  bool get isSmall => maxWidth <= AppBreakpoints.small;

  bool get isXLarge =>
      maxWidth > AppBreakpoints.large && maxWidth <= AppBreakpoints.extraLarge;

  bool get isXXLarge => maxWidth > AppBreakpoints.xxLarge;
}
