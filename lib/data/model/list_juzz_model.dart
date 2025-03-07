import 'package:isar/isar.dart';

part 'list_juzz_model.g.dart';

@collection
class ListJuzzModel {
  Id id = Isar.autoIncrement;
  int? juzzNumber;
  int? ayahAmount;
  int? startAyah;
  int? endAyah;

  @Index()
  DateTime? createdAt;

  DateTime? updatedAt;

  ListJuzzModel({
    required this.id, // ✅ Make sure `id` is required
    this.juzzNumber,
    this.ayahAmount,
    this.startAyah,
    this.endAyah,
    this.createdAt,
    this.updatedAt,
  });

  // JSON Conversion
  ListJuzzModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt() ??
        Isar.autoIncrement; // ✅ Use auto-increment if null
    juzzNumber = json['juzz_number']?.toInt();
    ayahAmount = json['ayah_amount']?.toInt();
    startAyah = json['start_ayah']?.toInt();
    endAyah = json['end_ayah']?.toInt();
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'juzz_number': juzzNumber,
      'ayah_amount': ayahAmount,
      'start_ayah': startAyah,
      'end_ayah': endAyah,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
