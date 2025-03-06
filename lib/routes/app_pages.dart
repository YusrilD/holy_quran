// app_pages.dart

import 'package:get/get.dart';
import 'package:holy_quran/binding/dashboard_binding.dart';
import 'package:holy_quran/routes/app_routes.dart';
import 'package:holy_quran/view/dashboard_screen.dart';

import '../binding/binding_auth.dart';
import '../view/menu/home/read_screen.dart';
import '../view/welcome_screen.dart';

class AppPages {
  static const INITIAL = AppRoutes.welcomeScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => WelcomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.readScreen,
      page: () => ReadScreen(),
      // binding: DashboardBinding(),
    ),
  ];
}
