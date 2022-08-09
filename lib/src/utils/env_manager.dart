// ignore_for_file: unused_catch_clause

import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/utils/parser_extension.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnvManager {
  static Map<String, String> _envConfigurations = {};

  static Future<T> _get<T>({required String key}) async {
    if (_envConfigurations.isEmpty) {
      await _load();
    }
    return _envConfigurations[key.trim()]!.toType(T);
  }

  static Future<String> getUrlToServer<T>(
      {required String serverUrl, String? serverPort}) async {
    if (serverPort != null && !Modular.get<MainAppStore>().runOnReleaseMode) {
      return '${await _get<String>(key: serverUrl)}:${await EnvManager._get<String>(key: serverPort)}';
    } else {
      return await _get<String>(key: serverUrl);
    }
  }

  static Future<void> _load() async {
    List<String> configurations = (await _readEnvFile()).split('\n');
    configurations.removeWhere((element) => element.startsWith('#'));

    _envConfigurations = {
      for (var configuration in configurations)
        configuration.split('=')[0].trim(): configuration.split('=')[1].trim()
    };
  }

  static Future<String> _readEnvFile() async {
    try {
      if (Modular.get<MainAppStore>().runOnReleaseMode) {
        return await rootBundle.loadString('assets/prod.env');
      } else {
        return await rootBundle.loadString('assets/dev.env');
      }
    } on Exception catch (e) {
      throw Exception('File "assets/dev.env" not found');
    }
  }
}
