import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  // Stream that exposes connectivity status changes
  Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  // Check current connectivity status once
  Future<bool> isConnected() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}