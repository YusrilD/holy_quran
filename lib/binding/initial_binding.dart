import 'package:get/get.dart';

import '../service/api_service.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ApiService>(ApiService(), permanent: true);
  }
}