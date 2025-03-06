import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../utils/text_theme.dart';

class ListOfJuzzScreen extends StatelessWidget {
  ListOfJuzzScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView(
          children: List.generate(
            homeC.listJuzz.length,
            (index) {
              var item = homeC.listJuzz[index];
              return ListTile(
                title: Text("${item.juzzNumber}"),
                subtitle: Text("${item.ayahAmount}"),
              );
            },
          ),
        );
      },
    );
  }
}
