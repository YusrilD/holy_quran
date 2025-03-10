import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/utils/extensions/spacing_extension.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../data/model/list_juzz_model.dart';
import '../../../utils/app_images.dart';
import '../../../utils/constant.dart';
import '../../../utils/text_theme.dart';

class ListOfJuzzScreen extends StatelessWidget {
  ListOfJuzzScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (homeC.isLoadingJuzz.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            homeC.listJuzz.length,
            (index) {
              var item = homeC.listJuzz[index];
              return Column(
                children: [
                  // ListTile(
                  //   title: Text("${item.juzzNumber}"),
                  //   subtitle: Text("${item.ayahAmount}"),
                  // ),
                  InkWell(
                    onTap: () {
                      homeC.getJuzz(item);
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

  Widget _listTile(ListJuzzModel item) {
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
                "${item.juzzNumber}",
                textAlign: TextAlign.center,
                style: textTheme.bodySmall,
              ).paddingAll(16),
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
                "Juzz ${item.juzzNumber}",
                style: textTheme.bodyMedium,
              ),
              Text(
                "${item.ayahAmount} ayat",
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 8.0);
  }
}
