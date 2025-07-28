import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/app_router.dart';
import 'package:lazu_tree/app/core/bloc_observer/app_bloc_observer.dart';
import 'package:lazu_tree/app/core/logger/logger.dart';
import 'package:lazu_tree/app/core/logger/logger_talker_impl.dart';
import 'package:lazu_tree/app/shared/ui/scroll_behavior/app_scroll_behavior.dart';
import 'package:lazu_tree/app/shared/ui/theme/dark_theme.dart';
import 'package:lazu_tree/app/shared/ui/theme/light_theme.dart';
import 'package:lazu_tree/app/shared/ui/theme/theme_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  static Widget providerAppBuilder(BuildContext context, Widget child) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Logger>(
          create: (context) => LoggerTalkerImpl.getInstance(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit()..initializeTheme(),
          ),
        ],
        child: child,
      ),
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
      BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.config,
            debugShowCheckedModeBanner: false,
            title: 'Achados da Lazu',
            theme: LightTheme.theme,
            darkTheme: DarkTheme.theme,
            themeMode: state.themeMode.idiomaticThemeMode,
            scrollBehavior: AppScrollBehavior(),
            builder: FToastBuilder(),
          );
        },
      ),
    );
  }
}
