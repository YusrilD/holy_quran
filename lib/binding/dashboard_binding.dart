import 'package:get/get.dart';
import 'package:holy_quran/controller/pray_schedule_controller.dart';
import 'package:holy_quran/data/repository/home_screen_repository.dart';
import 'package:holy_quran/data/repository/pray_screen_repository.dart';

import '../controller/dashboard_controller.dart';
import '../controller/home_screen_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeScreenRepository());
    Get.put(HomeScreenController());
    Get.put(PrayScreenRepository());
    Get.put(PrayScheduleController());
  }
}
