import 'package:get/get.dart';
import 'package:holy_quran/controller/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    // TODO: implement dependencies
  }
}