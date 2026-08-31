import 'sync_service.dart';

Future<void> testSync() async {
  final syncService = SyncService();

  try {
    final data = await syncService.syncData();

    print('SYNC SUCCESS: $data');
  } catch (e) {
    print('SYNC FAILED: $e');
  }
}