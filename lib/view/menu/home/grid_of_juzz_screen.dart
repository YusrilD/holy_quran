import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/utils/extensions/spacing_extension.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/constant.dart';
import '../../../utils/text_theme.dart';

class GridOfJuzzScreen extends StatelessWidget {
  GridOfJuzzScreen({super.key});

  var textTheme = AppTextTheme.getTextTheme();
  var homeC = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount = (constraints.maxWidth ~/ 150).clamp(2, 6);
      return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: homeC.listJuzz.length,
        itemBuilder: (context, index) {
          var item = homeC.listJuzz[index];
          return InkWell(
            onTap: () {
              homeC.getJuzz(item);
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        ).paddingAll(8),
                      ),
                    ),
                  ),
                  8.0.verticalSpace,
                  Text(
                    "Juzz ${item.juzzNumber}",
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
