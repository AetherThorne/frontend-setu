// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:setu_swasthya/features/auth/login_screen.dart'; // Ensure correct package name path

// Screen stubs for multi-role architecture
class AshaHomeScreen extends StatelessWidget {
  const AshaHomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SizedBox(),
        ),
        body: Center(child: Text('ASHA Field Home - Due Today')),
      );
}

class FacilityDashboardScreen extends StatelessWidget {
  const FacilityDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Facility Console (CHO / MO)')),
      );
}

class DistrictDashboardScreen extends StatelessWidget {
  const DistrictDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('District & Block Dashboard')),
      );
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/field-home',
      builder: (context, state) => const AshaHomeScreen(),
    ),
    GoRoute(
      path: '/facility-dashboard',
      builder: (context, state) => const FacilityDashboardScreen(),
    ),
    GoRoute(
      path: '/district-dashboard',
      builder: (context, state) => const DistrictDashboardScreen(),
    ),
  ],
  redirect: (context, state) {
    // Add auth token and role check logic here if needed
    return null;
  },
);