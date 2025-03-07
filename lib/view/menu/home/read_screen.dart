import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../utils/text_theme.dart';
import '../../../utils/widgets/custom_net_image.dart';

// ignore: must_be_immutable
class ReadScreen extends StatelessWidget {
  ReadScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();
  List<String> images = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          if (homeC.isLoadingSingleJuzz.value ||
              homeC.isLoadingSingleSurah.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: images.length,
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) {
              var item = images[index];
              var statusBarHeight = MediaQuery.of(context).padding.top;
              return ImageFromNet(
                imgUrl: item,
              ).paddingOnly(
                top: index == 0 ? statusBarHeight : 0.0,
              );
            },
          );
        },
      ),
    );
  }
}
