import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/data/model/juzz_model.dart';
import 'package:holy_quran/data/model/list_surah_model.dart';
import 'package:holy_quran/data/model/surah_model.dart';
import 'package:holy_quran/data/repository/home_screen_repository.dart';
import 'package:holy_quran/routes/app_routes.dart';
import 'package:holy_quran/utils/constant.dart';
import 'package:holy_quran/utils/constant.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

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
  var listOfFavoriteSurah = <ListSurahModel>[].obs;

  var isLoadingSurah = false.obs;
  var isLoadingJuzz = false.obs;
  var isLoadingSingleSurah = false.obs;
  var isLoadingSingleJuzz = false.obs;
  var selectedIndexPage = 0.obs;
  var selectedViewPage = 0.obs;
  var selectedLastReadIndexPage = 0.obs;

  late PageController quranPageCtrl;
  late PageController lastReadPageCtrl;

  void fetchSurahs() async {
    final allSurahs = await isarService.getBySavingType(saveAsLastRead);
    final favoriteSurah = await isarService.getBySavingType(saveAsFavorite);
    listOfFavoriteSurah.assignAll(favoriteSurah);
    lastRead.assignAll(allSurahs);
    lastReadTemp.value = lastRead.reversed.toList();
    if (lastReadTemp.length > 3) {
      lastReadTemp.removeRange(3, lastReadTemp.length);
    }
    print("lastRead: ${jsonEncode(lastReadTemp)}");
    print("favorite: ${jsonEncode(listOfFavoriteSurah)}");
  }

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
    saveSurah(
      surahAsParam,
      SavingType.lastRead,
    );
  }

  void saveSurah(ListSurahModel surahAsParam, SavingType type) async {
    surahAsParam.savingType =
        type == SavingType.lastRead ? saveAsLastRead : saveAsFavorite;
    await isarService.save(surahAsParam);
    fetchSurahs();
  }

  /// Get a Single Juzz
  Future<void> getJuzz(ListJuzzModel juzzAsParam) async {
    await fetchData<JuzzModel>(
      isLoading: isLoadingSingleJuzz,
      apiCall: () => _homeScreenRepository.getJuzz("${juzzAsParam.juzzNumber}"),
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

enum SavingType {
  lastRead,
  favorite,
}
