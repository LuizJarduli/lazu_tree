import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/auth/login_sign_in_page.dart';
import 'package:lazu_tree/app/features/not_found/not_found_page.dart';

class AuthRoute {
  static const authPath = '/auth';

  static final GoRouter route = GoRouter(
    routes: [
      GoRoute(
        path: '$authPath/sign-in',
        builder: LoginSignInPage.providerPageBuilder,
      ),
      GoRoute(
        path: '$authPath/sign-up',
        builder: (_, __) => const NotFoundPage(),
      ),
    ],
  );
}
