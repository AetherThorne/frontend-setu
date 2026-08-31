// lib/features/patient/data/patient_sync_repository.dart
import 'package:hive/hive.dart';
import 'patient_model.dart';

class PatientSyncRepository {
  Future<void> savePatientLocally(PatientLocal patient) async {
    final box = Hive.box<PatientLocal>('patients_box');
    await box.put(patient.abhaId, patient);
  }

  // Fetch all unsynced local records
  List<PatientLocal> getUnsyncedPatients() {
    final box = Hive.box<PatientLocal>('patients_box');
    return box.values.where((p) => !p.synced).toList();
  }

  // Mark a specific record as synced after a successful network push
  Future<void> markAsSynced(String abhaId) async {
    final box = Hive.box<PatientLocal>('patients_box');
    final patient = box.get(abhaId);
    if (patient != null) {
      patient.synced = true;
      await patient.save();
    }
  }
}