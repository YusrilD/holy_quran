import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/controller/dashboard_controller.dart';
import 'package:holy_quran/view/menu/dua/dua_screen.dart';
import 'package:holy_quran/view/menu/favorite/favorite_screen.dart';
import 'package:holy_quran/view/menu/home/home_screen.dart';
import 'package:holy_quran/view/menu/pray/pray_screen.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/text_theme.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  var dashboardC = Get.find<DashboardController>();
  var textTheme = AppTextTheme.getTextTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return Center(
            child: [
              const HomeScreen(),
              const FavoriteScreen(),
              const PrayScreen(),
              const DuaScreen(),
            ].elementAt(dashboardC.selectedIndex.value),
          );
        },
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(0, -4),
              blurRadius: 24,
              color: const Color(AppColor.secondary).withOpacity(0.24))
        ]),
        child: Obx(
          () {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _iconItem(
                    false,
                    AppImages.homeIcon,
                  ),
                  activeIcon: _iconItem(
                    true,
                    AppImages.homeIcon,
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                    icon: _iconItem(
                      false,
                      AppImages.favoritesIcon,
                    ),
                    activeIcon: _iconItem(
                      true,
                      AppImages.favoritesIcon,
                    ),
                    label: 'Favorit'),
                BottomNavigationBarItem(
                  icon: _iconItem(
                    false,
                    AppImages.prayScheduleIcon,
                  ),
                  activeIcon: _iconItem(
                    true,
                    AppImages.prayScheduleIcon,
                  ),
                  label: 'Sholat',
                ),
                BottomNavigationBarItem(
                  icon: _iconItem(
                    false,
                    AppImages.duasIcon,
                  ),
                  activeIcon: _iconItem(
                    true,
                    AppImages.duasIcon,
                  ),
                  label: 'Do\'a',
                ),
              ],
              currentIndex: dashboardC.selectedIndex.value,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(AppColor.primary),
              unselectedItemColor: const Color(AppColor.secondary),
              selectedLabelStyle: textTheme.bodySmall!.copyWith(
                color: const Color(AppColor.primary),
                fontSize: 12,
              ),
              unselectedLabelStyle: textTheme.bodySmall!.copyWith(
                fontSize: 12,
                color: const Color(AppColor.primary),
              ),
              onTap: (index) {
                print("check index: $index");
                dashboardC.selectedIndex.value = index;
              },
            );
          },
        ),
      ),
    );
  }

  Widget _iconItem(bool isActive, String icon) {
    var _color = isActive ? AppColor.primary : AppColor.transparent;
    var _imgColor = isActive ? AppColor.white : AppColor.secondary;
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(_color),
      ),
      child: Image.asset(
        icon,
        width: 30,
        height: 30,
        color: Color(_imgColor),
      ).paddingAll(4),
    );
  }
}
