// lib/core/services/background_sync_service.dart
import 'package:setu_swasthya/core/network/api_service.dart';
import 'package:setu_swasthya/features/patient/data/patient_sync_repository.dart';

class BackgroundSyncService {
  final PatientSyncRepository _syncRepo = PatientSyncRepository();
  final ApiService _apiService = ApiService();

  bool _isSyncing = false;

  Future<void> syncPendingData() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final unsyncedPatients = _syncRepo.getUnsyncedPatients();

      if (unsyncedPatients.isNotEmpty) {
        for (var patient in unsyncedPatients) {
          try {
            final payload = {
              'abha_id': patient.abhaId,
              'name': patient.name,
              'age': patient.age,
            };

            final result = await _apiService.syncPatientData(payload);

            if (result['statusCode'] >= 200 && result['statusCode'] < 300) {
              await _syncRepo.markAsSynced(patient.abhaId);
            }
          } catch (e) {
            // Handle individual item failure silently
          }
        }
      }
    } finally {
      _isSyncing = false;
    }
  }
}