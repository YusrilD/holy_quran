import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/controller/user_controller.dart';
import 'package:holy_quran/routes/app_routes.dart';
import 'package:holy_quran/utils/extensions/spacing_extension.dart';
import 'package:holy_quran/utils/widgets/custom_button.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/text_theme.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var userC = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            kToolbarHeight.verticalSpace,
            Text(
              "Al Qur'anul Karim",
              style: textTheme.headlineLarge,
            ),
            Text(
              "Banyak barokah baca Al-Quran setiap hari",
              style: textTheme.bodySmall,
            ),
            kToolbarHeight.verticalSpace,
            Stack(
              children: [
                Image.asset(
                  AppImages.welcomeImg,
                  color: Colors.white,
                  width: Get.width * 0.9,
                  height: Get.height * 0.61,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppImages.welcomeImg,
                      // scale: 1.9,
                      width: Get.width * 0.8,
                      height: Get.height * 0.6,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      text: "Mulai Mengaji",
                      width: Get.width * 0.5,
                      onPressed: () {
                        userC.checkUser();
                      },
                      color: AppColor.amber,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
