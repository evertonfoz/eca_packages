import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

getDeviceName() async {
  late String _deviceName;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    _deviceName = androidInfo.model;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    _deviceName = iosInfo.utsname.machine ?? '';
  } else {
    _deviceName = 'Desconhecido';
  }

  return _deviceName;
}
