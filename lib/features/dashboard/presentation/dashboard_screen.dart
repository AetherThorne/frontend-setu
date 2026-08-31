import 'package:flutter/material.dart';
import '../../patient/presentation/patient_registration_screen.dart'; // Correct relative path (up two levels into features/patient)
import '../../triage/presentation/triage_screen.dart';
import '../../referral/presentation/referral_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETU-Swasthya Dashboard'), // Fixed typo here
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Syncing offline records...')),
              );
            },
          ),
        ],
      ),
      // ... rest of your code
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _DashboardCard(
              title: 'Patient Entry',
              icon: Icons.person_add,
              color: Colors.teal,
              onTap: () {
                // Navigate to Patient Registration / Intake
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientRegistrationScreen()),
                );
              },
            ),
            _DashboardCard(
              title: 'Clinical Triage',
              icon: Icons.medical_services,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TriageScreen()),
                );
              },
            ),
            _DashboardCard(
              title: 'Referral Management',
              icon: Icons.local_hospital,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReferralScreen()),
                );
              },
            ),
            _DashboardCard(
              title: 'Offline Sync Queue',
              icon: Icons.cloud_done,
              color: Colors.purple,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All local data is up to date.')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}