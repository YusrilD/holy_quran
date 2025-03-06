class JuzzModel {
  int? juzz;
  int? ayahAmount;
  List<String?>? images;

  JuzzModel({
    this.juzz,
    this.ayahAmount,
    this.images,
  });
  JuzzModel.fromJson(Map<String, dynamic> json) {
    juzz = json['juzz']?.toInt();
    ayahAmount = json['ayah_amount']?.toInt();
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
    data['juzz'] = juzz;
    data['ayah_amount'] = ayahAmount;
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
