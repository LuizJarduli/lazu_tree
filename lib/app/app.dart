import 'package:flutter/material.dart';
import 'package:lazu_tree/app/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.config,
      debugShowCheckedModeBanner: false,
      title: 'Achados da Lazu',
    );
  }
}
