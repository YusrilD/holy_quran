class ListJuzzModel {
  int? id;
  int? juzzNumber;
  int? ayahAmount;
  int? startAyah;
  int? endAyah;
  String? createdAt;
  String? updatedAt;

  ListJuzzModel({
    this.id,
    this.juzzNumber,
    this.ayahAmount,
    this.startAyah,
    this.endAyah,
    this.createdAt,
    this.updatedAt,
  });
  ListJuzzModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    juzzNumber = json['juzz_number']?.toInt();
    ayahAmount = json['ayah_amount']?.toInt();
    startAyah = json['start_ayah']?.toInt();
    endAyah = json['end_ayah']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['juzz_number'] = juzzNumber;
    data['ayah_amount'] = ayahAmount;
    data['start_ayah'] = startAyah;
    data['end_ayah'] = endAyah;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
