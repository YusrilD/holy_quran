import 'package:get/get.dart';

import '../../service/api_service.dart';

class AuthRepository {
  final ApiService _apiService = Get.find<ApiService>();
  void setToken(String token) async {
    try {
      await _apiService.setAuthToken(token);
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  void initToken() async {
    try {
      await _apiService.init();
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  void loadAuth(Function(dynamic) result) async {
    try {
      var token = await _apiService.loadToken();

      initToken();
      var param = {
        "token": token,
        // "user_data": userTemp,
      };
      print("fuck this life 6");
      print("check the param: $param");
      result(param);
    } catch (e) {
      result({
        "token": null,
        "user_data": "",
      });
      // throw Exception("Login failed: $e");
    }
  }


}
