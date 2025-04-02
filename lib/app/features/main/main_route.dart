import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/main/main_page.dart';

class MainRoute {
  static const path = '/';

  static RouteBase route = GoRoute(
    path: path,
    builder: (context, state) => const MainPage(),
  );
}
