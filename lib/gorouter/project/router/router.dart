import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meteo_app/gorouter/pages/about.dart';
import 'package:meteo_app/gorouter/pages/contact_us.dart';
import 'package:meteo_app/gorouter/pages/home.dart';
import 'package:meteo_app/gorouter/pages/profile.dart';

class MyRouter {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      ),
      GoRoute(
        path: '/contact_us',
        builder: (BuildContext context, GoRouterState state) {
          return const ContactUs();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return const Profile();
        },
      ),
      GoRoute(
        path: '/about',
        builder: (BuildContext context, GoRouterState state) {
          return const About();
        },
      ),
    ],
  );
}
