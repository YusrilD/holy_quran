import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/data/database/isar_service.dart';
import 'package:holy_quran/data/model/user/user_model.dart';
import 'package:holy_quran/utils/constant.dart';
import 'package:holy_quran/utils/extensions/spacing_extension.dart';
import 'package:holy_quran/utils/widgets/custom_dialog.dart';
import 'package:holy_quran/utils/widgets/custom_textfield.dart';

import '../routes/app_routes.dart';
import '../utils/text_theme.dart';

class UserController extends GetxController {
  final IsarService isarService = IsarService();
  var tecUsername = TextEditingController().obs;
  var user = <UserModel>[].obs;
  var textTheme = AppTextTheme.getTextTheme();

  void checkUser() async {
    final userFromDB = await isarService.getFirst<UserModel>();
    if (userFromDB == null) {
      CustomDialogs.showFreeWidgetDialog(
        
        Get.context!,
        title: "Assalamu\'alaikum",
        content: "Mohon isikan nama Anda!",
        onConfirm: () {
          saveSurah(tecUsername.value.text);
        },
        widget: ColoredBox(
          color: Colors.white,
          child: SizedBox(
            height: Get.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selamat datang di Qur'anku, isikan nama Anda untuk memulai baca.",
                  style: textTheme.bodySmall,
                ),
                mainMargin.verticalSpace,
                CustomTextField.normalTextFormField(
                  label: "Nama",
                  hint: "Isikan Nama",
                  controller: tecUsername.value,
                  autoFocus: true,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      user.assign(userFromDB);
      Get.toNamed(
        AppRoutes.dashboardScreen,
      );
    }
  }

  void saveSurah(String name) async {
    var userData = UserModel(name: name);
    await isarService.save(userData);
    final userFromDB = await isarService.getFirst<UserModel>();
    if (userFromDB != null) {
      user.assign(userFromDB);
      Get.toNamed(
        AppRoutes.dashboardScreen,
      );
    } else {
      CustomDialogs.showErrorDialog(
        Get.context!,
        title: "Perhatian",
        content: "Terjadi Kesalahan, silahkan ulangi proses!",
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
