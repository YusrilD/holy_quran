import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:holy_quran/data/database/isar_service.dart';
import 'package:holy_quran/data/model/user/user_model.dart';
import 'package:holy_quran/utils/widgets/custom_dialog.dart';
import 'package:holy_quran/utils/widgets/custom_textfield.dart';

import '../routes/app_routes.dart';

class UserController extends GetxController {
  final IsarService isarService = IsarService();
  var tecUsername = TextEditingController().obs;
  var user = <UserModel>[].obs;

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
        widget: SizedBox(
          height: Get.height * 0.2,
          child: Column(
            children: [
              CustomTextField.normalTextFormField(
                label: "Nama",
                hint: "Isikan Nama",
                controller: tecUsername.value,
              ),
            ],
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
