import 'package:go_router/go_router.dart';
import 'package:ticketmaster/model/ticket_response.dart';
import 'package:ticketmaster/screens/home_page.dart';
import 'package:ticketmaster/screens/splash_screen.dart';
import 'package:ticketmaster/screens/ticket_details_page.dart';
import 'package:ticketmaster/screens/ticket_purchase_page.dart';
import 'package:ticketmaster/screens/ticket_search_page.dart';
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
    GoRoute(
      path: '/homepage', // Handle '/app' directly without redirection
      pageBuilder:
          (context, state) => buildMyTransition<void>(
            color: injector.palette.inactiveTextColor,
            child: const HomePage(),
          ),
    ),
    GoRoute(
      path: '/eventSearch', // Handle '/app' directly without redirection
      pageBuilder:
          (context, state) => buildMyTransition<void>(
            color: injector.palette.inactiveTextColor,
            child: const TicketSearchPage(),
          ),
    ),
    GoRoute(
      path: '/ticketDetails', // Handle '/app' directly without redirection
      pageBuilder: (context, state) {
        final ticket = state.extra as Event;
        return buildMyTransition<void>(
          color: injector.palette.inactiveTextColor,
          child: TicketDetailsPage(event: ticket),
        );
      },
    ),
    GoRoute(
      path: '/ticketPurchase', // Handle '/app' directly without redirection
      pageBuilder: (context, state) {
        final ticketPath = state.extra as String;
        return buildMyTransition<void>(
          color: injector.palette.inactiveTextColor,
          child: TicketPurchasePage(stringUrl: ticketPath),
        );
      },
    ),
  ],
);
