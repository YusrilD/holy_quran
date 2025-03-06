import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:holy_quran/controller/home_screen_controller.dart';
import 'package:holy_quran/utils/app_images.dart';
import 'package:holy_quran/utils/constant.dart';
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
            color: isActive ? const Color(AppColor.primary) : Colors.transparent,
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
            height: Get.height * 0.15,
            width: Get.width,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(
              0.2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          child: SizedBox(
            height: Get.height * 0.15,
            width: Get.width,
          ),
        ),
        Positioned(
          left: 0,
          child: SizedBox(
            height: Get.height * 0.15,
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
                      "Terakhir baca",
                      style: textTheme.bodyMedium!
                          .copyWith(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  "Nama Surat " * 2,
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "7 Ayat",
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ).paddingAll(mainMargin),
          ),
        ),
      ],
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
