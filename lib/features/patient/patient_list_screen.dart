import 'package:flutter/material.dart';

import 'patient_details_screen.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patients = [
      {
        'name': 'Ravi Kumar',
        'age': '52',
        'village': 'Rampur',
        'risk': 'High',
      },
      {
        'name': 'Sunita Devi',
        'age': '27',
        'village': 'Lakshmipur',
        'risk': 'Medium',
      },
      {
        'name': 'Mohan Singh',
        'age': '64',
        'village': 'Rajpur',
        'risk': 'Low',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  patient['name']![0],
                ),
              ),
              title: Text(
                patient['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Age: ${patient['age']} • ${patient['village']}',
              ),
              trailing: Text(
                patient['risk']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: patient['risk'] == 'High'
                      ? Colors.red
                      : patient['risk'] == 'Medium'
                          ? Colors.orange
                          : Colors.green,
                ),
              ),

              // 👇 THIS IS THE IMPORTANT PART
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientDetailsScreen(
                      patient: patient,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}