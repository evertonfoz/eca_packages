import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<Placemark> getCurrentLocation() async {
  try {
    await _handleLocationPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return await _getAddressFromLatLng(position);
  } catch (e) {
    rethrow;
  }
}

Future<void> _handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception(
        'O serviço de localização está desabilitado em seu dispositivo. Por favor, habilite-os.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Permissão para localização foi negada.');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    throw Exception(
        'Permissão para localização foi permanentemente negada, não é possível obter nova permissão.');
  }
  return;
}

Future<Placemark> _getAddressFromLatLng(Position position) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

  return placemarks[0];
}
