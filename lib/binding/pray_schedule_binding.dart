import 'package:get/get.dart';
import 'package:holy_quran/controller/pray_schedule_controller.dart';
import 'package:holy_quran/data/repository/pray_screen_repository.dart';

class PrayScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrayScreenRepository());
    Get.put(PrayScheduleController());
    // TODO: implement dependencies
  }
}
