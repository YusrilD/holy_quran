import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:holy_quran/controller/home_screen_controller.dart';
import 'package:holy_quran/controller/user_controller.dart';
import 'package:holy_quran/data/model/list_surah_model.dart';
import 'package:holy_quran/utils/app_images.dart';
import 'package:holy_quran/utils/constant.dart';
import 'package:holy_quran/utils/extensions/last_index_extension.dart';
import 'package:holy_quran/utils/extensions/spacing_extension.dart';
import 'package:holy_quran/utils/utils.dart';
import 'package:holy_quran/view/menu/home/list_of_juzz_screen.dart';
import 'package:holy_quran/view/menu/home/list_of_surah_screen.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();
  var userC = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              children: [
                (kToolbarHeight / 2).verticalSpace,
                // _appBar(),
                // mainMargin.verticalSpace,
                _greeting(),
                8.0.verticalSpace,
                _lastRead(),
                mainMargin.verticalSpace,
                _pageController(),
                8.0.verticalSpace,
                const Divider(),
                Obx(
                  () {
                    if (homeC.selectedIndexPage.value == 0) {
                      return ListOfSurahScreen();
                    }
                    return ListOfJuzzScreen();
                  },
                ),
              ],
            ).paddingSymmetric(
              vertical: 8,
              horizontal: 16.0,
            );
          }
          return ListView(
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              (kToolbarHeight / 2).verticalSpace,
              _appBar(),
              mainMargin.verticalSpace,
              _greeting(),
              mainMargin.verticalSpace,
              _lastRead(),
              mainMargin.verticalSpace,
              _pageController(),
              8.0.verticalSpace,
              Obx(
                () {
                  if (homeC.selectedIndexPage.value == 0) {
                    return ListOfSurahScreen();
                  }
                  return ListOfJuzzScreen();
                },
              ),

              // _read(orientation),
            ],
          ).paddingSymmetric(
            vertical: 8,
            horizontal: 16.0,
          );
        },
      ),
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

  Widget _pageController() {
    var listItem = ["Surat", "Juzz"];
    var viewItem = [
      Icons.list_rounded,
      Icons.grid_on_rounded,
    ];
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                listItem.length,
                (index) {
                  var isActive = homeC.selectedIndexPage.value == index;
                  return _itemColumn(listItem[index], isActive, index)
                      .paddingOnly(
                    right: mainMargin,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                viewItem.length,
                (index) {
                  var isActive = homeC.selectedViewPage.value == index;
                  return _itemView(viewItem[index], isActive, index)
                      .paddingOnly(
                    right: mainMargin / 2,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _itemView(IconData icon, bool isActive, int index) {
    return InkWell(
      onTap: () {
        homeC.selectedViewPage.value = index;
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isActive ? const Color(AppColor.primary) : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isActive
              ? Colors.white
              : const Color(
                  AppColor.primary,
                ),
        ),
      ),
    );
  }

  Widget _itemColumn(String item, bool isActive, int index) {
    return InkWell(
      onTap: () {
        homeC.selectedIndexPage.value = index;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item,
            style: textTheme.bodyMedium!.copyWith(
              color: isActive
                  ? const Color(AppColor.primary)
                  : const Color(
                      AppColor.secondary,
                    ),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              fontSize: 20,
              letterSpacing: 1,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color:
                  isActive ? const Color(AppColor.primary) : Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
            ),
            child: SizedBox(
              height: 4,
              width: (12 * item.length).toDouble(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _read(Orientation orientation) {
    homeC.listQuran.value = [
      ListOfSurahScreen(),
      ListOfJuzzScreen(),
    ];
    if (orientation == Orientation.portrait) {
      return Expanded(
        flex: 5,
        child: PageView.builder(
          controller: homeC.quranPageCtrl,
          itemCount: homeC.listQuran.length,
          onPageChanged: (value) {
            homeC.selectedIndexPage.value = value;
          },
          itemBuilder: (context, index) {
            return homeC.listQuran[index];
          },
        ),
      );
    }
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: PageView.builder(
        controller: homeC.quranPageCtrl,
        itemCount: homeC.listQuran.length,
        onPageChanged: (value) {
          homeC.selectedIndexPage.value = value;
        },
        itemBuilder: (context, index) {
          return homeC.listQuran[index];
        },
      ),
    );
  }

  Widget _lastRead() {
    return Obx(
      () {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.lastReadIcon,
                  scale: 1.8,
                  color: const Color(AppColor.secondary),
                ),
                8.0.horizontalSpace,
                Text(
                  homeC.lastRead.isEmpty ? "Mulai baca" : "Terakhir baca",
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            4.0.verticalSpace,
            homeC.lastRead.isEmpty
                ? Text(
                    "Pilih Surat atau Juzz\ndi bawah ini",
                    style: textTheme.bodyMedium,
                  )
                : _detailLastRead(),
            8.0.verticalSpace,
            _indicator(),
          ],
        );
      },
    );
  }

  Widget _indicator() {
    return Obx(
      () {
        return Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            homeC.lastReadTemp.length,
            (index) {
              var isActive = homeC.selectedLastReadIndexPage.value == index;
              return DecoratedBox(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(20),
                  color: isActive
                      ? const Color(AppColor.primary)
                      : const Color(AppColor.primary).withOpacity(0.3),
                ),
                child: SizedBox(
                  height: 10,
                  width: isActive ? 40 : 10,
                ),
              ).paddingOnly(right: 4);
            },
          ),
        );
      },
    );
  }

  Widget _detailLastRead() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        // border: Border.all(
        //   color: const Color(AppColor.primary),
        //   width: 1.5,
        // ),
        image: DecorationImage(
            image: ExactAssetImage(
              AppImages.lastReadImg,
            ),
            fit: BoxFit.cover),
      ),
      child: SizedBox(
        height: 60,
        width: Get.width,
        child: PageView.builder(
          controller: homeC.lastReadPageCtrl,
          itemCount: homeC.lastReadTemp.length,
          onPageChanged: (value) {
            homeC.selectedLastReadIndexPage.value = value;
          },
          itemBuilder: (context, index) {
            var item = homeC.lastReadTemp[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Surat ${item.name}",
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${item.ayahAmount} Ayat",
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10);
          },
        ),
      ),
    );
  }

  Widget _appBar() {
    return Text(
      "Al Quranul Karim",
      style: textTheme.headlineLarge!.copyWith(
        fontSize: 24,
      ),
    );
  }

  Widget _greeting() {
    return Text(
      "Assalamulaikum ${userC.user.first.name}",
      style:
          textTheme.titleMedium!.copyWith(color: const Color(AppColor.primary)),
    );
  }
}
