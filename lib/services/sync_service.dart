import 'api_client.dart';

class SyncService {
  final ApiClient apiClient;

  SyncService({ApiClient? apiClient})
      : apiClient = apiClient ?? ApiClient();

  Future<dynamic> syncData() async {
    final response = await apiClient.get('/todos/1');

    return response.data;
  }
}