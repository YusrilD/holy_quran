import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../utils/text_theme.dart';
import '../../../utils/widgets/custom_net_image.dart';

class ReadScreen extends StatelessWidget {
  ReadScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();
  List<String> images = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (_, index) {
          var item = images[index];
          return ImageFromNet(
            imgUrl: item,
            shape: BoxShape.rectangle,
            width: Get.width,
            height: Get.height,
            boxFit: BoxFit.contain,
          );
        },
      ),
    );
  }
}
