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
      backgroundColor: Colors.white,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: images.length,
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) {
          var item = images[index];
          return ImageFromNet(
            imgUrl: item,
            shape: BoxShape.rectangle,
            width: Get.width,
            height: Get.height * 0.9,
            boxFit: BoxFit.contain,
            radiusBottomLeft: 0,
            radiusBottomRight: 0,
            radiusTopLeft: 0,
            radiusTopRight: 0,
          ).paddingOnly(
            top: index == 0 ? MediaQuery.of(context).padding.top : 0,
          );
        },
      ),
    );
  }
}
