import 'package:go_router/go_router.dart';
import 'package:very_good_blog_app/features/add_blog/add_blog.dart';
import 'package:very_good_blog_app/features/blog/blog.dart';
import 'package:very_good_blog_app/features/login/login.dart';
import 'package:very_good_blog_app/features/main/main.dart';
import 'package:very_good_blog_app/features/register/register.dart';
import 'package:very_good_blog_app/features/setting/setting.dart';
import 'package:very_good_blog_app/features/splash/splash.dart';

class AppRoute {
  static const splash = '/';
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const setting = '/setting';
  static const addBlog = '/add';
  static const blog = '/blog';

  static final route = GoRouter(
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) {
          return const MainView();
        },
      ),
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: login,
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: setting,
        builder: (context, state) {
          return const SettingView();
        },
      ),
      GoRoute(
        path: addBlog,
        builder: (context, state) {
          return const AddBlogView();
        },
      ),
      GoRoute(
        path: blog,
        builder: (context, state) {
          return const BlogView();
        },
      )
    ],
    // initialLocation: home,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
  );
}