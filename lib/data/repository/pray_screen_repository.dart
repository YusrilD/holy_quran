import 'package:get/get.dart';

import '../../service/api_service.dart';
import '../../utils/app_endpoints.dart';

class PrayScreenRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<List<dynamic>> getPraySchedule({
    required String location,
    required String year,
    required String month,
  }) async {
    try {
      var url = "${_apiService.prayScheduleUrl}$location/$year/$month.json";
      final response = await _apiService.getRequest(
        "",
        useOtherUrl: true,
        otherUrl: url,
      );
      return response;
    } catch (e) {
      throw Exception("Exception getPraySchedule: $e");
    }
  }
}
