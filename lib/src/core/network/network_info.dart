import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      Modular.get<http.Client>();
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
}
