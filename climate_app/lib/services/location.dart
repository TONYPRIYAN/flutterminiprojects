import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
class Location{

  double? latitute1;
  double? longitute1;

  Future<void> getCurrentlocation() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      // If permission is granted, attempt to get the current position
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
            latitute1 = position.latitude;
            longitute1 = position.longitude;
        print("Location: ${position.latitude}, ${position.longitude}");
      } catch (e) {
        // Handle error if position cannot be retrieved
        print("Error getting location: $e");
      }
    } else {
      // Handle the case where location permission is not granted.
      // You can show a dialog or request permission again.
      print("Location permission not granted");
    }

  }

}
