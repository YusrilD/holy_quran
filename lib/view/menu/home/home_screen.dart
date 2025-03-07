import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:holy_quran/controller/home_screen_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          _read(),
        ],
      ).paddingSymmetric(
        vertical: 8,
        horizontal: 16.0,
      ),
    );
  }

  Widget _pageController() {
    var listItem = ["Surat", "Juzz"];
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            listItem.length,
            (index) {
              var isActive = homeC.selectedIndexPage.value == index;
              return _itemColumn(listItem[index], isActive).paddingOnly(
                right: mainMargin,
              );
            },
          ),
        );
      },
    );
  }

  Widget _itemColumn(String item, bool isActive) {
    return Column(
      children: [
        Text(
          item,
          style: textTheme.bodyMedium!.copyWith(
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
    );
  }

  Widget _read() {
    homeC.listQuran.value = [
      ListOfSurahScreen(),
      ListOfJuzzScreen(),
    ];
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

  Widget _lastRead() {
    return Obx(
      () {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
              child: Image.asset(
                AppImages.lastReadImg,
                fit: BoxFit.cover,
                height: Get.height * 0.2,
                width: Get.width,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(
                  0.4,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: SizedBox(
                height: Get.height * 0.2,
                width: Get.width,
              ),
            ),
            Positioned(
              left: 0,
              child: SizedBox(
                height: Get.height * 0.2,
                width: Get.width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.lastReadIcon,
                          scale: 1.8,
                        ),
                        8.0.horizontalSpace,
                        Text(
                          homeC.lastRead.isEmpty
                              ? "Mulai baca"
                              : "Terakhir baca",
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    homeC.lastRead.isEmpty
                        ? Text(
                            "Pilih Surat atau Juzz\ndi bawah ini",
                            style: textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                          )
                        : _detailLastRead(),
                    _indicator(),
                  ],
                ).paddingAll(mainMargin),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _indicator() {
    return Obx(
      () {
        return SizedBox(
          height: 10,
          width: Get.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              homeC.lastReadTemp.length,
              (index) {
                var isActive = homeC.selectedLastReadIndexPage.value == index;
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isActive ? Colors.white : Colors.white.withOpacity(0.3),
                  ),
                  child: const SizedBox(
                    height: 10,
                    width: 10,
                  ).paddingOnly(right: 4),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _detailLastRead() {
    return Expanded(
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
          );
        },
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assalamulaikum",
          style: textTheme.bodyMedium,
        ),
        Text(
          "Yuk ngaji, ${greetings()} ini",
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}
