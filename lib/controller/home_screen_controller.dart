import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/data/model/juzz_model.dart';
import 'package:holy_quran/data/model/list_surah_model.dart';
import 'package:holy_quran/data/model/surah_model.dart';
import 'package:holy_quran/data/repository/home_screen_repository.dart';
import 'package:holy_quran/routes/app_routes.dart';

import '../data/database/isar_service.dart';
import '../data/model/list_juzz_model.dart';

class HomeScreenController extends GetxController {
  final IsarService isarService = IsarService();
  final _homeScreenRepository = Get.find<HomeScreenRepository>();
  var listSurah = <ListSurahModel>[].obs;
  var listJuzz = <ListJuzzModel>[].obs;
  var surah = SurahModel().obs;
  var juzz = JuzzModel().obs;
  var listQuran = <dynamic>[].obs;

  var lastRead = <ListSurahModel>[].obs;
  var lastReadTemp = <ListSurahModel>[].obs;

  var isLoadingSurah = false.obs;
  var isLoadingJuzz = false.obs;
  var isLoadingSingleSurah = false.obs;
  var isLoadingSingleJuzz = false.obs;
  var selectedIndexPage = 0.obs;
  var selectedLastReadIndexPage = 0.obs;

  late PageController quranPageCtrl;
  late PageController lastReadPageCtrl;

  void fetchSurahs() async {
    final allSurahs = await isarService.getAll<ListSurahModel>();
    lastRead.assignAll(allSurahs);
    print("coba cek sik rene: ${jsonEncode(lastRead)}");
    // Reverse the list
    lastReadTemp.value = lastRead.reversed.toList();
    print("nek ilang ga mungkin: ${jsonEncode(lastReadTemp)}");

// Keep only the latest 3 by removing excess elements
    if (lastReadTemp.length > 3) {
      lastReadTemp.removeRange(3, lastReadTemp.length);
    }

    print("coba cek sik runu: ${jsonEncode(lastReadTemp)}");
    // lastRead.assignAll(allSurahs.take(3).toList());
  }

  // void leaveItThree() async {
  //   await isarService.delete<Surah>(id);

  //   // Fetch all Surahs from the database
  //   final allSurahs = await isarService.getAll<Surah>();

  //   // If there are more than 3, delete the oldest ones
  //   if (allSurahs.length > 3) {
  //     allSurahs.sort((a, b) => b.id.compareTo(a.id)); // Sort by newest first
  //     for (int i = 3; i < allSurahs.length; i++) {
  //       await isarService.delete<Surah>(allSurahs[i].id);
  //     }
  //   }
  // }

  Future<void> fetchDataList<T>({
    required RxBool isLoading,
    required Future<Map<String, dynamic>> Function() apiCall,
    required Function(List<T>) onSuccess,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    isLoading.value = true;
    try {
      final response = await apiCall();
      final List<T> dataList =
          response['data'].map<T>((e) => fromJson(e)).toList();
      onSuccess(dataList);
    } catch (e) {
      print("Error: $e"); // Log error properly
      Get.snackbar("Error", e.toString()); // Show user-friendly error
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchData<T>({
    required RxBool isLoading,
    required Future<Map<String, dynamic>> Function() apiCall,
    required Function(T) onSuccess, // Expect a single object instead of a list
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    isLoading.value = true;
    try {
      final response = await apiCall();
      final T data = fromJson(response['data']); // Convert to a single object
      onSuccess(data);
    } catch (e) {
      print("Error: $e"); // Log error properly
      Get.snackbar("Error", e.toString()); // Show user-friendly error
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getListSurah() async {
    await fetchDataList<ListSurahModel>(
      isLoading: isLoadingSurah,
      apiCall: () => _homeScreenRepository.getListSurah(),
      onSuccess: (data) => listSurah.value = data,
      fromJson: (e) => ListSurahModel.fromJson(e),
    );
  }

  /// Get List of Juzz
  Future<void> getListJuzz() async {
    await fetchDataList<ListJuzzModel>(
      isLoading: isLoadingJuzz,
      apiCall: () => _homeScreenRepository.getListJuzz(),
      onSuccess: (data) => listJuzz.value = data,
      fromJson: (e) => ListJuzzModel.fromJson(e),
    );
  }

  /// Get a Single Surah
  Future<void> getSurah(ListSurahModel surahAsParam) async {
    await fetchData<SurahModel>(
      isLoading: isLoadingSingleSurah,
      apiCall: () =>
          _homeScreenRepository.getSurah("${surahAsParam.surahNumber}"),
      onSuccess: (data) {
        surah.value = data;
        print("${jsonEncode(surah.value)}");
        Get.toNamed(
          AppRoutes.readScreen,
          arguments: surah.value.images,
        );
      },
      fromJson: (e) => SurahModel.fromJson(e),
    );
    saveSurahHistory(surahAsParam);
  }

  void saveSurahHistory(ListSurahModel surahAsParam) async {
    await isarService.save(surahAsParam);
    fetchSurahs();
  }

  /// Get a Single Juzz
  Future<void> getJuzz(JuzzModel juzzAsParam) async {
    await fetchData<JuzzModel>(
      isLoading: isLoadingSingleJuzz,
      apiCall: () => _homeScreenRepository.getJuzz("${juzzAsParam.juzz}"),
      onSuccess: (data) {
        juzz.value = data;
        Get.toNamed(
          AppRoutes.readScreen,
          arguments: juzz.value.images,
        );
      },
      fromJson: (e) => JuzzModel.fromJson(e),
    );
  }

  @override
  void dispose() {
    quranPageCtrl.dispose();
    lastReadPageCtrl.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    quranPageCtrl = PageController();
    lastReadPageCtrl = PageController();
    fetchSurahs();
    getListSurah(); // Fetch data on init
    getListJuzz();
  }
}
