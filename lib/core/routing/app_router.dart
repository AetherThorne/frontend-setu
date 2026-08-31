
import 'package:go_router/go_router.dart';

import 'package:prateek_frontend_lab/features/auth/login_screen.dart';
import 'package:prateek_frontend_lab/features/home/home_screen.dart';
import 'package:prateek_frontend_lab/features/patient/patient_list_screen.dart';
import 'package:prateek_frontend_lab/features/triage/triage_screen.dart';
import 'package:prateek_frontend_lab/features/referral/referral_screen.dart';
import 'package:prateek_frontend_lab/features/dashboard/dashboard_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/patients',
      builder: (context, state) => const PatientListScreen(),
    ),

    GoRoute(
      path: '/triage',
      builder: (context, state) => const TriageScreen(),
    ),

    GoRoute(
      path: '/referral',
      builder: (context, state) => const ReferralScreen(),
    ),

    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);