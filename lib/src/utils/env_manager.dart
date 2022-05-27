// ignore_for_file: unused_catch_clause


import 'package:eca_packages/src/utils/parser_extension.dart';
import 'package:flutter/services.dart';

class EnvManager {
  static Map<String, String> _envConfigurations = {};

  static Future<T> get<T>({required String key}) async {
    if (_envConfigurations.isEmpty) {
      await _load();
    }
    return _envConfigurations[key.trim()]!.toType(T);
  }

  static Future<void> _load() async {
    List<String> configurations = (await _readEnvFile()).split('\n');
    _envConfigurations = {
      for (var configuration in configurations)
        configuration.split('=')[0].trim(): configuration.split('=')[1].trim()
    };
  }

  static Future<String> _readEnvFile() async {
    try {
      return await rootBundle.loadString('assets/dev.env');
    } on Exception catch (e) {
      throw Exception('File "assets/dev.env" not found');
    }
  }
}
