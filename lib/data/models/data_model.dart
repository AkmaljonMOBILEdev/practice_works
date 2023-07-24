import 'package:main_project/data/models/airline_model.dart';

class DataModel {
  final String name;
  final int trips;
  final List<AirLineModel> airline;

  DataModel({
    required this.name,
    required this.trips,
    required this.airline,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json["name"] ?? "",
      trips: json["trips"] ?? 0,
      airline: (json["airline"] as List<dynamic>?)
              ?.map((e) => AirLineModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
