import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:lazu_tree/app/app.dart';

void main() {
  // use Path url strategy
  usePathUrlStrategy();

  // bootstrap App
  runApp(const App());
}
