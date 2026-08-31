// lib/core/services/sync_worker.dart
import 'package:connectivity_plus/connectivity_plus.dart';

class SyncWorker {
  static void initializeConnectivityListener(Function() onReconnected) {
    Connectivity().onConnectivityChanged.listen((dynamic results) {
      bool isConnected = false;
      
      if (results is List) {
        isConnected = results.any((r) => r != ConnectivityResult.none);
      } else {
        isConnected = results != ConnectivityResult.none;
      }
          
      if (isConnected) {
        onReconnected();
      }
    });
  }
}