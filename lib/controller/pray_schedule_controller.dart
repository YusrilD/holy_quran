import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:holy_quran/data/model/pray/pray_model.dart';
import 'package:holy_quran/data/repository/pray_screen_repository.dart';

class PrayScheduleController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var address = "Press button to get location".obs;
  var isLoading = false.obs;
  final _prayScreenRepository = Get.find<PrayScreenRepository>();
  var listOfPraySchedule = <PrayModel>[].obs;

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
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude.value, longitude.value);

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

  Future<void> getData() async {
    isLoading.value = true;
    try {
      await getRegency();
      final response = await _prayScreenRepository.getPraySchedule(
        location: regency.value
            .replaceAll("Kabupaten", "")
            .replaceAll("Kota", "")
            .replaceAll(" ", "")
            .toLowerCase(),
        year: "${DateTime.now().year}",
        month: "${DateTime.now().month}".length == 1
            ? "0${DateTime.now().month}"
            : "${DateTime.now().month}",
      );

      print("checking the response: $response");
      var schedule = jsonEncode(response);
      final List<dynamic> jsonData = jsonDecode(schedule);
      listOfPraySchedule.value =
          jsonData.map<PrayModel>((e) => PrayModel.fromJson(e)).toList();

      isLoading.value = false;
    } catch (e) {
      print("apa sih: $e");

      throw Exception("Get assessment failed!");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
