import'package:go_router/go_router.dart';
import 'package:notification_counter/core/routing/app_routes_names.dart';
import 'package:notification_counter/features/notifications/presentation/screens/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesNames.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutesNames.homeScreen,
        name: AppRoutesNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
