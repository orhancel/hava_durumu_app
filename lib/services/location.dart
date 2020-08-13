import 'package:geolocator/geolocator.dart';

class Location {
  double latitute;
  double longtitute;

  Future<void> getCurrentLocation() async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    print(geolocationStatus.toString());
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitute = position.latitude;
      longtitute = position.longitude;
      print(latitute);
      print(longtitute);
    } catch (e) {
      print(e);
    }
  }
}
