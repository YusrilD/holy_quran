class PrayModel {
  String? imsyak;
  String? shubuh;
  String? dzuhur;
  String? tanggal;
  String? terbit;
  String? magrib;
  String? isya;
  String? dhuha;
  String? ashr;

  PrayModel({
    this.imsyak,
    this.shubuh,
    this.dzuhur,
    this.tanggal,
    this.terbit,
    this.magrib,
    this.isya,
    this.dhuha,
    this.ashr,
  });
  PrayModel.fromJson(Map<String, dynamic> json) {
    imsyak = json['imsyak']?.toString();
    shubuh = json['shubuh']?.toString();
    dzuhur = json['dzuhur']?.toString();
    tanggal = json['tanggal']?.toString();
    terbit = json['terbit']?.toString();
    magrib = json['magrib']?.toString();
    isya = json['isya']?.toString();
    dhuha = json['dhuha']?.toString();
    ashr = json['ashr']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imsyak'] = imsyak;
    data['shubuh'] = shubuh;
    data['dzuhur'] = dzuhur;
    data['tanggal'] = tanggal;
    data['terbit'] = terbit;
    data['magrib'] = magrib;
    data['isya'] = isya;
    data['dhuha'] = dhuha;
    data['ashr'] = ashr;
    return data;
  }
}
