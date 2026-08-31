
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prateek_frontend_lab/core/routing/app_router.dart';
import 'services/test_sync.dart';

void main() {
  testSync();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/patient/data/patient_model.dart'; // Import your patient model
import 'core/router/app_router.dart';

void main() async {
  // 1. Ensure Flutter bindings are initialized before async tasks
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Hive for Flutter local storage
  await Hive.initFlutter();

  // 3. Register the generated Hive adapter
  Hive.registerAdapter(PatientLocalAdapter());

  // 4. Open the local patient box so it's ready for use across the app
  await Hive.openBox<PatientLocal>('patients_box');

  runApp(const SetuSwasthyaApp());
}

class SetuSwasthyaApp extends StatelessWidget {
  const SetuSwasthyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SETU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
      routerConfig: appRouter, // Connects your go_router configuration
      title: 'SETU-Swasthya',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
    );
  }
}