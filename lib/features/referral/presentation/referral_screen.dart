import 'package:flutter/material.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  String _selectedFacility = 'District Hospital';

  void _submitReferral() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Referral submitted successfully to $_selectedFacility!'),
          backgroundColor: Colors.teal,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue Patient Referral'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                initialValue: _selectedFacility,
                decoration: const InputDecoration(labelText: 'Target Facility', border: OutlineInputBorder()),
                items: ['Community Health Center', 'District Hospital', 'Medical College / Tertiary Care'].map((facility) {
                  return DropdownMenuItem(value: facility, child: Text(facility));
                }).toList(),
                onChanged: (val) => setState(() => _selectedFacility = val!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _reasonController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Clinical Notes / Reason for Referral',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? 'Please specify clinical notes' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitReferral,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text('Dispatch Referral', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}