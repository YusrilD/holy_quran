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
    return Obx(
      () {
        if (homeC.isLoadingSurah.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: EdgeInsets.zero,
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
                    child: _listTile(item),
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

  Widget _listTile(ListSurahModel item) {
    return Obx(
      () {
        var isFavorite = homeC.listOfFavoriteSurah.any(
          (e) {
            return e.name == item.name && e.ayahAmount == item.ayahAmount;
          },
        );
        // print("checking the item : ${item.name} is it contain in: $isFavorite");
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          AppImages.numberingIcon,
                        ),
                      ),
                    ),
                    child: Text(
                      "${item.surahNumber}",
                      // maxLines: 1,
                      // overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall,
                    ).paddingAll(12),
                  ),
                ),
                // 8.0.horizontalSpace,
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
            ),
            // const Divider()
          ],
        ).paddingSymmetric(vertical: 8.0);
      },
    );
  }
}
