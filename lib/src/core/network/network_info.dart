import 'package:eca_packages/eca_packages.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<String> get serverIPAddress;
  resetServerIPAddress();
}

class NetworkInfoImpl implements NetworkInfo {
  String? _serverIPAddress;

  @override
  Future<bool> get isConnected async {
    try {
      Modular.get<
          http.Client>(); //TODO POG para o XBUsiness, tirar após refatoração
      final response = await Modular.get<http.Client>().get(
        Uri.parse('http://www.google.com'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return true;
    }
    // final response = await Modular.get<http.Client>().get(
    //   Uri.parse('http://www.google.com'),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    // );

    // if (response.statusCode == 200) {
    //   return true;
    // }

    // return false;
  }

  @override
  Future<String> get serverIPAddress async {
    // return await await EnvManager.getUrlToServer(serverUrl: 'server_url');
    try {
      String? serverURL;
      if (_serverIPAddress == null) {
        serverURL = await EnvManager.getUrlToServer(serverUrl: 'server_url');
      }

      // if (!kIsWeb && Platform.isAndroid && _serverIPAddress == null) {
      // final prefs = await SharedPreferences.getInstance();
      // _serverIPAddress = 'http://${prefs.getString('serverIP') ?? serverURL}';
      // TODO REVER ECA_PACKAGES
      // }
      return _serverIPAddress ?? serverURL!;
    } on Exception catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  resetServerIPAddress() {
    _serverIPAddress = null;
  }
}
