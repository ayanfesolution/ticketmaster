import 'package:go_router/go_router.dart';
import 'package:ticketmaster/utils/injector.dart';
import 'package:ticketmaster/utils/transition.dart';

final router = GoRouter(
  initialLocation:
      '/app', // Set initial route directly instead of using redirect
  redirect: (context, state) {
    final currentPath = state.fullPath;
    print(currentPath);

    if (currentPath == '') {
      // If not authenticated and not already on the login page, redirect to login
      return '/app';
    }
    // if (isAuthenticated && isLoggingIn) {
    //   // If authenticated and trying to access login page, redirect to dashboard
    //   return '/dashboard';
    // }
    return null; // No redirect needed
  },
  routes: [
    GoRoute(
      path: '/app', // Handle '/app' directly without redirection
      pageBuilder:
          (context, state) => buildMyTransition<void>(
            color: injector.palette.inactiveTextColor,
            child: const SplashScreen(),
          ),
    ),
  ],
);
