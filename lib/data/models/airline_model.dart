class AirLineModel {
  final String name;
  final String country;
  final String logo;
  final String website;

  AirLineModel({
    required this.name,
    required this.country,
    required this.logo,
    required this.website,
  });

  factory AirLineModel.fromJson(Map<String, dynamic> json) {
    return AirLineModel(
      name: json["name"] ?? "",
      country: json["country"] ?? "",
      logo: json["logo"] ?? "",
      website: json["website"] ?? "",
    );
  }
}
