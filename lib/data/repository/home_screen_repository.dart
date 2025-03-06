import 'package:get/get.dart';
import 'package:holy_quran/utils/app_endpoints.dart';

import '../../service/api_service.dart';

class HomeScreenRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<Map<String, dynamic>> getListSurah() async {
    try {
      final response = await _apiService.getRequest(listSurahEndpoint);
      return response;
    } catch (e) {
      throw Exception("Exception: $e");
    }
  }

  Future<Map<String, dynamic>> getListJuzz() async {
    try {
      final response = await _apiService.getRequest(listJuzzEndpoint);
      return response;
    } catch (e) {
      throw Exception("Exception: $e");
    }
  }

  Future<Map<String, dynamic>> getSurah(String surahNumber) async {
    try {
      var endpoint = "$surahEndpoint/$surahNumber";
      final response = await _apiService.getRequest(endpoint);
      return response;
    } catch (e) {
      throw Exception("Exception: $e");
    }
  }

  Future<Map<String, dynamic>> getJuzz(String juzzNumber) async {
    try {
      var endpoint = "$juzzEndpoint/$juzzNumber";
      final response = await _apiService.getRequest(endpoint);
      return response;
    } catch (e) {
      throw Exception("Exception: $e");
    }
  }
}