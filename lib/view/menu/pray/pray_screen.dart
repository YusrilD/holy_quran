import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pray_schedule_controller.dart';

class PrayScreen extends StatelessWidget {
  PrayScreen({super.key});

  var prayScheduleC = Get.find<PrayScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () {
            return ListView(
              children: List.generate(prayScheduleC.listOfPraySchedule.length,
                  (index) {
                var item = prayScheduleC.listOfPraySchedule[index];
                return ListTile(
                  title: Text("${item.tanggal}"),
                  subtitle: Text("${item.shubuh}"),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
