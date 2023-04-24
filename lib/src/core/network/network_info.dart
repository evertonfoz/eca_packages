import 'dart:io';

import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<String> get serverIPAddress;
  resetServerIPAddress();
  Future<bool> isAppServerAvailable(Function verifyServerAvailability);
}

class NetworkInfoImpl implements NetworkInfo {
  String? _serverIPAddress;

  @override
  Future<bool> get isConnected async {
    bool isOnline = false;
    try {
      if (!kIsWeb) {
        final lookupResult = await InternetAddress.lookup('www.google.com');
        // 'https://clownfish-app-lrirg.ondigitalocean.app');
        isOnline =
            lookupResult.isNotEmpty && lookupResult[0].rawAddress.isNotEmpty;
        // } else {
        //   final lookupResult = await http.get(Uri.parse('www.google.com'));
        //   isOnline = lookupResult.statusCode == 200;
      }
    } on SocketException catch (_) {
      isOnline = false;
    }
    return isOnline;
  }

  @override
  Future<String> get serverIPAddress async {
    try {
      String? serverURL;
      if (_serverIPAddress == null) {
        serverURL = await EnvManager.getUrlToServer(serverUrl: 'server_url');
      }

      return _serverIPAddress ?? serverURL!;
    } on Exception catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  resetServerIPAddress() {
    _serverIPAddress = null;
  }

  @override
  Future<bool> isAppServerAvailable(Function verifyServerAvailability) async {
    return await verifyServerAvailability();
  }
}
