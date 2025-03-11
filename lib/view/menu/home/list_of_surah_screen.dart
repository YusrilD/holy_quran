import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/routes/app_routes.dart';
import 'package:holy_quran/utils/app_images.dart';
import 'package:holy_quran/utils/constant.dart';
import 'package:holy_quran/utils/extensions/spacing_extension.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../data/model/list_surah_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_theme.dart';

class ListOfSurahScreen extends StatelessWidget {
  ListOfSurahScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (ctx, ori) {
        return Obx(
          () {
            if (homeC.isLoadingSurah.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                homeC.listSurah.length,
                (index) {
                  var item = homeC.listSurah[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          
                          homeC.getSurah(item);
                        },
                        child: _listTile(item, ori),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _listTile(ListSurahModel item, Orientation ori) {
    return Obx(
      () {
        var isFavorite = homeC.listOfFavoriteSurah.any(
          (e) {
            return e.name == item.name && e.ayahAmount == item.ayahAmount;
          },
        );
        return Row(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                    AppImages.numberingIcon,
                  ),
                ),
              ),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${item.surahNumber}",
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall,
                  ).paddingAll(8),
                ),
              ),
            ),
            mainMargin.horizontalSpace,
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.name}",
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    "${item.surahType} | ${item.ayahAmount} ayat",
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: Get.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${item.arabName}",
                      style: textTheme.titleMedium!.copyWith(
                        color: const Color(
                          AppColor.primary,
                        ),
                      ),
                    ),
                    8.0.horizontalSpace,
                    InkWell(
                      onTap: () {
                        print("fav kepencet");
                        homeC.saveSurah(item, SavingType.favorite);
                      },
                      child: isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline_rounded,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 8.0);
      },
    );
  }
}
