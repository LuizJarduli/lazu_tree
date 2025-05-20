import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/app_router.dart';
import 'package:lazu_tree/app/core/bloc_observer/app_bloc_observer.dart';
import 'package:lazu_tree/app/core/logger/logger.dart';
import 'package:lazu_tree/app/core/logger/logger_talker_impl.dart';

class App extends StatefulWidget {
  const App({super.key});

  static Widget providerAppBuilder(BuildContext context, Widget child) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Logger>(
          create: (context) => LoggerTalkerImpl.getInstance(),
        ),
      ],
      child: child,
    );
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    GoRouter.optionURLReflectsImperativeAPIs = true;

    Bloc.observer = AppBlocObserver(LoggerTalkerImpl.getInstance());
  }

  @override
  Widget build(BuildContext context) {
    return App.providerAppBuilder(
      context,
      MaterialApp.router(
        routerConfig: AppRouter.config,
        debugShowCheckedModeBanner: false,
        title: 'Achados da Lazu',
      ),
    );
  }
}
