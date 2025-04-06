import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_lab_app/main.dart';
import 'package:quiz_lab_app/screens/home/home_screen.dart';
import 'package:quiz_lab_app/screens/home/sub_home_screen.dart';
import 'package:quiz_lab_app/screens/login_screen.dart';
import 'package:quiz_lab_app/screens/profile/profile_screen.dart';
import 'package:quiz_lab_app/screens/profile/settings_screen.dart';
import 'package:quiz_lab_app/screens/splash_screen.dart';
import 'package:quiz_lab_app/screens/test_screen.dart';
import 'package:quiz_lab_app/screens/wapper/main_wrapper.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/splash";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome = GlobalKey<NavigatorState>(
    debugLabel: 'shellHome',
  );
  static final _shellNavigatorSettings = GlobalKey<NavigatorState>(
    debugLabel: 'shellSettings',
  );

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    // Añadir redirección basada en autenticación
    redirect: (BuildContext context, GoRouterState state) {
      final bool isLoggedIn = supabase.auth.currentSession != null;
      final bool isLoggingIn = state.matchedLocation == '/login';
      final bool isSplash = state.matchedLocation == '/splash';

      // Si está en splash, dejar que la lógica de splash maneje la navegación
      if (isSplash) return null;

      // Si no está autenticado y no está en login, redirigir a login
      if (!isLoggedIn && !isLoggingIn) return '/login';

      // Si está autenticado y está intentando ir a login, redirigir a home
      if (isLoggedIn && isLoggingIn) return '/home';

      // Sin redirección
      return null;
    },
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'subHome',
                    name: 'SubHome',
                    pageBuilder:
                        (context, state) => CustomTransitionPage<void>(
                          key: state.pageKey,
                          child: const SubHomeScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                        ),
                  ),
                ],
              ),
            ],
          ),

          /// Brach Setting
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/profile",
                name: "Profile",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: "settings",
                    name: "Settings",
                    pageBuilder: (context, state) {
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: const SettingsScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      /// Player
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/test',
        name: "Test",
        builder: (context, state) => TestScreen(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/login',
        name: "Login",
        builder: (context, state) => LoginScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/splash',
        name: "Splash",
        builder: (context, state) => SplashScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/',
        redirect: (_, __) => '/home', // Redirige automáticamente a /home
      ),
    ],
  );
}
