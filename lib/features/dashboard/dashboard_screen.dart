import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prateek_frontend_lab/providers/app_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(isOnlineProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SETU'),
      ),
      body: Center(
        child: Text(
          isOnline ? 'ONLINE' : 'OFFLINE',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}