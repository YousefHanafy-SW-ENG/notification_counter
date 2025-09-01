import'package:go_router/go_router.dart';
import 'package:notification_counter/core/routing/app_routes_names.dart';
import 'package:notification_counter/features/notifications/presentation/screens/home_screen.dart';
import 'package:notification_counter/features/notifications/presentation/screens/root_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesNames.mainScreen,
    routes: [
      GoRoute(
        path: AppRoutesNames.mainScreen,
        name: AppRoutesNames.mainScreen,
        builder: (context, state) => const RootScreen(),
      ),
      GoRoute(
        path: AppRoutesNames.homeScreen,
        name: AppRoutesNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
