import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pray_schedule_controller.dart';

class PrayScreen extends StatelessWidget {
  PrayScreen({super.key});

  var prayScheduleC = Get.find<PrayScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Latitude: ${prayScheduleC.latitude.value}",
                  style: const TextStyle(fontSize: 18),
                )),
            Obx(() => Text(
                  "Longitude: ${prayScheduleC.longitude.value}",
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 20),
            Obx(() => Text(
                  "Address: ${prayScheduleC.address.value}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 40),
            Obx(
              () => ElevatedButton(
                onPressed: prayScheduleC.isLoading.value
                    ? null
                    : () => prayScheduleC.getLocation(),
                child: prayScheduleC.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Get Current Location"),
              ),
            ),

            Obx(() => Text(
              "Regency: ${prayScheduleC.regency.value}",
              style: TextStyle(fontSize: 18),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => prayScheduleC.getRegency(),
              child: Text("Get My Regency"),
            ),
          ],
        ),
      ),
    );
  }
}
