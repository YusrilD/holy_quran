class SurahModel {
  String? surah;
  String? arabName;
  int? surahNumber;
  String? surahType;
  int? ayahAmount;
  int? pages;
  List<String?>? images;

  SurahModel({
    this.surah,
    this.arabName,
    this.surahNumber,
    this.surahType,
    this.ayahAmount,
    this.pages,
    this.images,
  });
  SurahModel.fromJson(Map<String, dynamic> json) {
    surah = json['surah']?.toString();
    arabName = json['arab_name']?.toString();
    surahNumber = json['surah_number']?.toInt();
    surahType = json['surah_type']?.toString();
    ayahAmount = json['ayah_amount']?.toInt();
    pages = json['pages']?.toInt();
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['surah'] = surah;
    data['arab_name'] = arabName;
    data['surah_number'] = surahNumber;
    data['surah_type'] = surahType;
    data['ayah_amount'] = ayahAmount;
    data['pages'] = pages;
    if (images != null) {
      final v = images;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['images'] = arr0;
    }
    return data;
  }
}
