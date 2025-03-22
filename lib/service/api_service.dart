// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetxService {
  final String _baseUrl = "https://dpplaboratory.online/public/api";
  final String prayScheduleUrl =
      "https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/";
  // https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/malang/2025/03.json
  RxBool isLoggedIn = false.obs;
  String? _authToken;

  // Singleton setup
  static ApiService get to => Get.find();

  // Helper function to get headers
  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };
  }

  // Optionally load token from shared preferences or secure storage
  Future<void> init() async {
    _authToken = await loadToken(); // Load token from SharedPreferences
  }

  // Loading token from SharedPreferences
  Future<String?> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Saving the token to SharedPreferences
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'auth_token', token); // Save the token to shared preferences
  }

  // Set or update the auth token (used when logging in)
  Future<void> setAuthToken(String token) async {
    _authToken = token;
    isLoggedIn.value = _authToken != null && _authToken!.isNotEmpty;
    saveToken(token); // Save token to SharedPreferences
  }

  // Clear auth token (e.g., on logout)
  void clearAuthToken() async {
    _authToken = null;
    isLoggedIn.value = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  bool checkLoginStatus() {
    return isLoggedIn.value;
  }

  // Generic GET request
  Future<dynamic> getRequest(
    String endpoint, {
    bool useOtherUrl = false,
    String otherUrl = "",
  }) async {
    var theUrl = useOtherUrl ? otherUrl : _baseUrl;
    final url = Uri.parse("$theUrl$endpoint");
    print("yuru yuri: $url");
    try {
      final response = await http.get(
        url,
        headers: _headers(),
      );
      print("I need the response: ${response.statusCode}");
      if (response.statusCode == 401) {
        final newToken = await refreshToken();
        if (newToken != null) {
          final retryResponse = await http.get(
            url,
            headers: _headers(),
          );
          return _handleResponse(retryResponse);
        } else {
          throw Exception("Token refresh failed in get and url: $url");
        }
      }
      return _handleResponse(response);
    } catch (e) {
      throw Exception("GET request failed: $e");
    }
  }

  
  // Generic POST request
  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    print("url: $url");
    try {
      final response = await http.post(
        url,
        headers: _headers(),
        body: jsonEncode(data),
      );

      print("woi login: and status: ${response.statusCode}");

      if (response.statusCode == 401) {
        print("kalau expired ya masuk sini lah");
        final newToken = await refreshToken();
        if (newToken != null) {
          final retryResponse = await http.post(
            url,
            headers: _headers(),
            body: jsonEncode(data),
          );
          return _handleResponse(retryResponse);
        } else {
          throw Exception("Token refresh failed in post and url: $url");
        }
      }
      return _handleResponse(response);
    } catch (e) {
      print("something werong: $e");
      throw Exception("POST request failed: $e");
    }
  }

  // Future<dynamic> requestToken(String endpoint, String expiredToken) async {
  //   final url = Uri.parse("$_baseUrl$endpoint");

  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $expiredToken', // Include expired token here
  //       },
  //     );

  //     if (response.statusCode == 200) {}

  //     return _handleResponse(response);
  //   } catch (e) {
  //     throw Exception("Token request failed: $e");
  //   }
  // }

  // Generic PUT request
  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    print("the url: $url");
    try {
      final response = await http.put(
        url,
        headers: _headers(),
        body: jsonEncode(data),
      );
      print(
          "check response in put: ${response.body}, with status code: ${response.statusCode}");

      if (response.statusCode == 401) {
        final newToken = await refreshToken();
        if (newToken != null) {
          final retryResponse = await http.post(
            url,
            headers: _headers(),
            body: jsonEncode(data),
          );
          return _handleResponse(retryResponse);
        } else {
          throw Exception("Token refresh failed in put and url: $url");
        }
      }
      return _handleResponse(response);
    } catch (e) {
      throw Exception("PUT request failed: $e");
    }
  }

  // Generic DELETE request
  Future<dynamic> deleteRequest(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    try {
      final response = await http.delete(url, headers: _headers());
      return _handleResponse(response);
    } catch (e) {
      throw Exception("DELETE request failed: $e");
    }
  }

  // Response handler for error checking and decoding JSON
  dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "Request failed with status: $statusCode. Body: ${response.body}");
    }
  }

  Future<dynamic> refreshToken() async {
    try {
      await init();

      print("rene gak yo");

      final url = Uri.parse("$_baseUrl/refresh");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_authToken', // Include expired token here
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final newAccessToken = body['access_token'];

        await setAuthToken(newAccessToken);
        // await SharedPreferencesHelper.saveRefreshToken(newRefreshToken);

        return _handleResponse(response);
      } else {
        // Handle refresh failure
        throw Exception("Failed to refresh token: ${response.body}");
      }
    } catch (e) {
      print("Gagal maning: $e");
      return;
    }
  }
}
