import 'package:flutter/material.dart';
import '../data/patient_model.dart';
import '../data/patient_sync_repository.dart';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() => _PatientRegistrationScreenState();
}

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _abhaController = TextEditingController();
  final PatientSyncRepository _syncRepo = PatientSyncRepository();
  bool _isLoading = false;
  bool _isFetchingAbha = false;

  // Simulates fetching patient data from the National ABHA registry using the ID
  void _simulateAbhaLookup(String abhaId) async {
    if (abhaId.trim().length < 14) return; // Standard ABHA length check

    setState(() => _isFetchingAbha = true);
    await Future.delayed(const Duration(seconds: 1)); // Network simulation

    // Mock response data fetched from ABHA registry
    setState(() {
      _nameController.text = "Aarav Sharma";
      _ageController.text = "28";
      _isFetchingAbha = false;
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Patient details auto-fetched from ABHA Registry!'), backgroundColor: Colors.blue),
    );
  }

  void _savePatient() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final newPatient = PatientLocal(
        abhaId: _abhaController.text.trim(),
        name: _nameController.text.trim(),
        age: int.parse(_ageController.text.trim()),
        synced: false,
      );

      try {
        await _syncRepo.savePatientLocally(newPatient);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient registered and saved locally!'), backgroundColor: Colors.green),
        );
        Navigator.pop(context);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save patient: ${e.toString()}'), backgroundColor: Colors.red),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _abhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Patient'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // ABHA ID field placed first so typing it can auto-fill the rest
              TextFormField(
                controller: _abhaController,
                decoration: InputDecoration(
                  labelText: 'ABHA ID / Health ID (e.g., 14-digit number)',
                  border: const OutlineInputBorder(),
                  suffixIcon: _isFetchingAbha 
                      ? const Padding(padding: EdgeInsets.all(10), child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.badge),
                ),
                onChanged: (value) {
                  if (value.trim().length == 14) {
                    _simulateAbhaLookup(value);
                  }
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter ABHA ID';
                  }
                  if (value.trim().length < 10) {
                    return 'ABHA ID must be at least 10-14 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Patient Full Name', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter patient name';
                  }
                  // Regex allowing only alphabetical characters and spaces
                  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
                  if (!nameRegex.hasMatch(value.trim())) {
                    return 'Name can only contain letters and spaces';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter age';
                  }
                  final age = int.tryParse(value.trim());
                  if (age == null) {
                    return 'Please enter a valid whole number';
                  }
                  if (age < 0 || age > 120) {
                    return 'Please enter a realistic age between 0 and 120';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _savePatient,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, padding: const EdgeInsets.symmetric(vertical: 16)),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Save & Register Patient', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}