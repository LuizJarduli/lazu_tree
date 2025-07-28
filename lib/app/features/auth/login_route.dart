import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/auth/login_sign_in_page.dart';

class LoginRoute {
  static const path = '/login';

  static final GoRoute route = GoRoute(
    path: path,
    builder: LoginSignInPage.providerPageBuilder,
  );
}
