import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/main/main_route.dart';
import 'package:lazu_tree/app/features/not_found/not_found_page.dart';

sealed class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _config = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: MainRoute.path,
    routes: [MainRoute.route],
    errorBuilder: (_, __) => const NotFoundPage(),
  );

  static GoRouter get config => _config;
}
