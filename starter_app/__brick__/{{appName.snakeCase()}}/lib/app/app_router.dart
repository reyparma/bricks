import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/presentation/pages/login_page.dart';
import 'package:{{appName.snakeCase()}}/features/user_profile/presentation/pages/user_profile_page.dart';
import 'package:{{appName.snakeCase()}}/features/home/presentation/pages/home_page.dart';
import 'package:{{appName.snakeCase()}}/features/home/presentation/pages/quote_info_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
      {{#useAuth}}
      initialLocation: '/login',
      {{/useAuth}}
      {{^useAuth}}
      initialLocation: '/',
      {{/useAuth}}
      routes: [
        {{#useAuth}}
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: '/',
          name: 'user_profile',
          builder: (context, state) {
            return const UserProfilePage();
          },
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/info',
          name: 'info',
          builder: (context, state) {
            return const QuoteInfoPage();
          },
        ),
        {{/useAuth}}
        {{^useAuth}}
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/info',
          name: 'info',
          builder: (context, state) {
            return const QuoteInfoPage();
          },
        ),
        {{/useAuth}}
      ],
      {{#useAuth}}redirect: _guard{{/useAuth}}
      );

  static String? _guard(BuildContext context, GoRouterState state) {
    final bool loggingIn = state.matchedLocation == '/login';
    if (context.read<AuthenticationBloc>().state is! LoggedIn) {
      return '/login';
    }
    // If the user is logged in but still on the login page, send them to
    // the profile page
    if (loggingIn) {
      return '/';
    }
    return null;
  }
}
