import 'package:get/get.dart';
import 'package:holy_quran/controller/auth_controller.dart';
import 'package:holy_quran/data/repository/auth_repository.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthRepository());
    Get.put(AuthController());
    // TODO: implement dependencies
  }
}