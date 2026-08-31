import 'package:flutter/material.dart';

import '../triage/triage_screen.dart';

class PatientDetailsScreen extends StatelessWidget {
  final Map<String, String> patient;

  const PatientDetailsScreen({
    super.key,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient['name']!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Age: ${patient['age']}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Village: ${patient['village']}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Risk Level: ${patient['risk']}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: patient['risk'] == 'High'
                            ? Colors.red
                            : patient['risk'] == 'Medium'
                                ? Colors.orange
                                : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TriageScreen(
                        patient: patient,
                      ),
                    ),
                  );
                },
                child: const Text('Start Triage'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}