class TimesModel {
  final String tong;
  final String quyosh;
  final String peshin;
  final String asr;
  final String shom;
  final String xufton;

  TimesModel(
      {required this.tong,
      required this.quyosh,
      required this.peshin,
      required this.asr,
      required this.shom,
      required this.xufton});

  factory TimesModel.fromJson(Map<String, dynamic> json) {
    return TimesModel(
      tong: json["tong_saharlik"] ?? "",
      quyosh: json["quyosh"] ?? "",
      peshin: json["peshin"] ?? "",
      asr: json["asr"] ?? "",
      shom: json["shom_iftor"] ?? "",
      xufton: json["hufton"] ?? "",
    );
  }
}
