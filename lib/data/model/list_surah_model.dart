class ListSurahModel {

  int? id;
  String? name;
  int? surahNumber;
  String? arabName;
  String? surahType;
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
