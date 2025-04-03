import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_page.dart';

class LinkTreeRoute {
  static const path = '/links';

  static final RouteBase route = GoRoute(
    path: path,
    builder: (context, state) => const LinkTreePage(),
  );
}
