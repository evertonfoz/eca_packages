import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

getDeviceName() async {
  late String deviceName;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceName = androidInfo.model;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceName = iosInfo.utsname.machine ?? '';
  } else {
    deviceName = 'Desconhecido';
  }

  return deviceName;
}
