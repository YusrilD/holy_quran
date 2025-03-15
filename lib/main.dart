import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/binding/initial_binding.dart';

import 'data/database/isar_service.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await IsarService.init();
  } catch (e) {
    Get.snackbar("Error", "Terjadi kesalahan pada database: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
