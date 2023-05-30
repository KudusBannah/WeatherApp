import 'package:geolocator/geolocator.dart';

class Locator {
  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(longitude);
      print(latitude);
    } catch (e) {
      return;
    }
  }
}
