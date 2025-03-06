import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/routes/app_routes.dart';
import 'package:holy_quran/utils/app_images.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_theme.dart';

class ListOfSurahScreen extends StatelessWidget {
  ListOfSurahScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView(
          padding: EdgeInsets.zero,
          children: List.generate(
            homeC.listSurah.length,
            (index) {
              var item = homeC.listSurah[index];
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      homeC.getSurah("${item.surahNumber}");
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      // else 2px still present
                      visualDensity: VisualDensity.compact,
                      leading: DecoratedBox(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(
                              AppImages.numberingIcon,
                            ),
                          ),
                        ),
                        child: Text(
                          "${item.surahNumber}",
                          style: textTheme.bodySmall,
                        ).paddingAll(12),
                      ),
                      title: Text(
                        "${item.name}",
                        style: textTheme.bodyMedium,
                      ),
                      subtitle: Text(
                        "${item.surahType} | ${item.ayahAmount} ayat",
                        style: textTheme.bodySmall,
                      ),
                      trailing: Text(
                        "${item.arabName}",
                        style: textTheme.titleMedium!.copyWith(
                          color: const Color(
                            AppColor.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
