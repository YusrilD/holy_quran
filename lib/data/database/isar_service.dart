import 'package:holy_quran/data/model/list_surah_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/list_juzz_model.dart';

class IsarService {
  static late Isar isar; // Global Isar instance

  static final IsarService _instance = IsarService._internal();
  factory IsarService() => _instance;
  IsarService._internal();

  /// Initialize Isar Database
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ListJuzzModelSchema, ListSurahModelSchema], // Add your schemas here
      directory: dir.path,
    );
  }

  /// Create or Update (Upsert)
  Future<void> save<T>(T item) async {
    await isar.writeTxn(() async {
      await isar.collection<T>().put(item);
    });
  }

  /// Read all
  Future<List<T>> getAll<T>() async {
    return await isar.collection<T>().where().findAll();
  }

  /// Read by ID
  Future<T?> getById<T>(int id) async {
    return await isar.collection<T>().get(id);
  }

  /// Delete by ID
  Future<void> delete<T>(int id) async {
    await isar.writeTxn(() async {
      await isar.collection<T>().delete(id);
    });
  }
}
