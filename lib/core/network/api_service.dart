import 'package:dio/dio.dart';

class ApiService {
  late final Dio _dio;

  // Change this to match your local backend server IP/port
  static const String baseUrl = 'http://192.168.1.50:8000';

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Optional: Add logging interceptor for clean debugging in the console
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Generic wrapper to handle network calls safely and return data cleanly
  Future<Map<String, dynamic>> _executeRequest(Future<Response> Function() requestFn) async {
    try {
      final response = await requestFn();
      return {
        'statusCode': response.statusCode ?? 500,
        'data': response.data,
      };
    } on DioException catch (e) {
      // Extract meaningful error information from Dio exceptions
      final statusCode = e.response?.statusCode ?? 500;
      final errorMessage = e.response?.data?['message'] ?? e.message ?? 'Unknown network error';
      
      return {
        'statusCode': statusCode,
        'error': errorMessage,
      };
    } catch (e) {
      return {
        'statusCode': 500,
        'error': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    return _executeRequest(() => _dio.post('/login', data: {
          'username': username,
          'password': password,
        }));
  }

  Future<Map<String, dynamic>> createPatient(Map<String, dynamic> patientData) async {
    return _executeRequest(() => _dio.post('/patients/', data: patientData));
  }

  Future<Map<String, dynamic>> submitTriage(Map<String, dynamic> triageData) async {
    return _executeRequest(() => _dio.post('/triage/', data: triageData));
  }

  // Matches the exact method call needed by your PatientSyncRepository
  Future<Map<String, dynamic>> syncPatientData(Map<String, dynamic> patientPayload) async {
    return _executeRequest(() => _dio.post('/sync/', data: patientPayload));
  }

  Future<Map<String, dynamic>> syncBatchData(List<Map<String, dynamic>> localQueue) async {
    return _executeRequest(() => _dio.post('/sync/', data: {'queue': localQueue}));
  }

  Future<Map<String, dynamic>> createReferral(Map<String, dynamic> referralData) async {
    return _executeRequest(() => _dio.post('/referrals/', data: referralData));
  }

  Future<Map<String, dynamic>> updateReferralStatus(String referralId, String status) async {
    return _executeRequest(() => _dio.patch('/referrals/$referralId/status', data: {
          'status': status,
        }));
  }
}