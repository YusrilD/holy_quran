import 'package:get/get.dart';
import 'package:holy_quran/controller/pray_schedule_controller.dart';

class PrayScheduleBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(PrayScheduleController());
    // TODO: implement dependencies
  }
}