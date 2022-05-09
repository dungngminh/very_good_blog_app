import 'package:go_router/go_router.dart';
import 'package:very_good_blog_app/features/home/home.dart';
import 'package:very_good_blog_app/features/login/login.dart';
import 'package:very_good_blog_app/features/splash/splash.dart';

class RouteManager {
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginView();
        },
      ),
    ],
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
  );
}