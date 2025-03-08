import 'package:isar/isar.dart';

part 'list_surah_model.g.dart';

@collection
class ListSurahModel {
  Id? id = Isar.autoIncrement;
  String? name;
  int? surahNumber;
  String? arabName;
  String? surahType;
  String? savingType;
  int? ayahAmount;
  int? startAyah;
  int? endAyah;
  String? createdAt;
  String? updatedAt;

  ListSurahModel({
    this.id,
    this.name,
    this.surahNumber,
    this.arabName,
    this.surahType,
    this.savingType,
    this.ayahAmount,
    this.startAyah,
    this.endAyah,
    this.createdAt,
    this.updatedAt,
  });

  ListSurahModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    surahNumber = json['surah_number']?.toInt();
    arabName = json['arab_name']?.toString();
    surahType = json['surah_type']?.toString();
    savingType =
        json['surah_type'] == null ? "" : json['surah_type'].toString();
    ayahAmount = json['ayah_amount']?.toInt();
    startAyah = json['start_ayah']?.toInt();
    endAyah = json['end_ayah']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surah_number'] = surahNumber;
    data['arab_name'] = arabName;
    data['surah_type'] = surahType;
    data['ayah_amount'] = ayahAmount;
    data['start_ayah'] = startAyah;
    data['end_ayah'] = endAyah;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
