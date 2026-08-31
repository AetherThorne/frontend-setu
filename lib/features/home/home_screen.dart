import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/connectivity_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isOnline = ref.watch(isOnlineProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HOME',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              isOnline ? 'ONLINE' : 'OFFLINE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isOnline ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}