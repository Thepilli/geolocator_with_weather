import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('Go to the profile screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/about'),
              child: const Text('Go to the about screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/contact_us'),
              child: const Text('Go to the contact_us screen'),
            ),
          ],
        ),
      ),
    );
  }
}
