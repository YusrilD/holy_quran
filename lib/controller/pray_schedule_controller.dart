import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PrayScheduleController extends GetxController{

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var address = "Press button to get location".obs;
  var isLoading = false.obs;

  var regency = "".obs; // Observable variable to store regency (kabupaten/kota)

  Future<void> getRegency() async {
    try {
      // Request permission
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        Get.snackbar("Permission Denied", "Location access is required");
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Reverse geocode to get address
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        regency.value = placemarks[0].subAdministrativeArea ??
            "Unknown"; // Get the regency/kabupaten
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to get location: $e");
    }
  }

  Future<void> getLocation() async {
    try {
      isLoading.value = true;

      // Check & request permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          address.value = "Location permissions are permanently denied.";
          return;
        }
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      // Convert to address
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latitude.value, longitude.value);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address.value =
        "${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}";
      } else {
        address.value = "Address not found!";
      }
    } catch (e) {
      address.value = "Error: $e";
    } finally {
      isLoading.value = false;
    }
  }

}