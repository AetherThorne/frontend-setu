import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityBanner extends StatefulWidget {
  const ConnectivityBanner({super.key});

  @override
  State<ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends State<ConnectivityBanner> {
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();
    // Listen to connection changes safely
    Connectivity().onConnectivityChanged.parseAndListen((result) {
      _updateStatus(result);
    });
  }

  Future<void> _checkInitialConnection() async {
    final result = await Connectivity().checkConnectivity();
    _updateStatus(result);
  }

  void _updateStatus(dynamic result) {
    bool offline = false;
    if (result is List<ConnectivityResult>) {
      offline = result.contains(ConnectivityResult.none);
    } else if (result is ConnectivityResult) {
      offline = result == ConnectivityResult.none;
    }
    
    setState(() {
      _isOffline = offline;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isOffline) return const SizedBox.shrink();

    return Container(
      color: Colors.redAccent,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.white, size: 18),
          SizedBox(width: 8),
          Text(
            'Offline Mode: Data will be saved locally and synced later.',
            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Extension helper to safely handle stream type variations across connectivity_plus versions
extension on Stream<dynamic> {
  void parseAndListen(void Function(dynamic) onData) {
    listen(onData);
  }
}