import 'package:arena_management/features/home/presentation/pages/home_page.dart';
import 'package:arena_management/features/home/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/homePage',
        builder: (context, state) => const HomePage(),
      )
    ],
  );
}
