import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/ui/screens/details/movie-details.dart';
import 'package:project/ui/screens/landing-lists/actors-landing-screen.dart';
import 'package:project/ui/screens/landing-screen.dart';
import 'package:project/ui/screens/myprofile_screen.dart';
import 'package:project/ui/screens/search-screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const LandingScreen(),
    ),
    GoRoute(
      path: '/actors',
      builder: (BuildContext context, GoRouterState state) =>
          const ActorsScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (BuildContext context, GoRouterState state) =>
          const SearchScreen(),
    ),
    GoRoute(
      path: '/my-profile',
      builder: (BuildContext context, GoRouterState state) =>
          const MyProfileScreen(),
    ),
    GoRoute(
        path: '/movieDetail/:movieId',
        builder: (context, state) =>
            MovieDetails(movieId: state.pathParameters['movieId']!)),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
