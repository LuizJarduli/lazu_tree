import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/auth/auth_route.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_route.dart';
import 'package:lazu_tree/app/features/main/main_route.dart';
import 'package:lazu_tree/app/features/not_found/not_found_page.dart';

sealed class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _config = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: MainRoute.path,
    routes: [
      MainRoute.route,
      LinkTreeRoute.route,
      ...AuthRoute.route.configuration.routes,
    ],
    errorBuilder: (_, __) => const NotFoundPage(),
  );

  static GoRouter get config => _config;
}
