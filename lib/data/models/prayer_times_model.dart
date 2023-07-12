import 'package:main_project/data/models/times_model.dart';

class PrayerTimesModel {
  final String region;
  final String date;
  final String weekday;
  final TimesModel times;

  PrayerTimesModel({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times,
  });

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimesModel(
      region: json["region"] ?? "",
      date: json["date"] ?? "",
      weekday: json["weekday"] ?? "",
      times: TimesModel.fromJson(json["times"]),
    );
  }
}
