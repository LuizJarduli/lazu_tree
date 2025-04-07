import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.config,
      debugShowCheckedModeBanner: false,
      title: 'Achados da Lazu',
    );
  }
}
