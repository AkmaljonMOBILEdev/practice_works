import 'package:main_project/data/models/free_user_model/results_model/location_model.dart';
import 'package:main_project/data/models/free_user_model/results_model/login_model.dart';
import 'package:main_project/data/models/free_user_model/results_model/name_model.dart';

class ResultsModel {
  final NameModel name;
  final LocationModel location;
  final String email;
  final LoginModel login;
  final int age;
  final String phone;
  final String picture;

  ResultsModel({
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.age,
    required this.phone,
    required this.picture,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      name: NameModel.fromJson(json["name"]),
      location: LocationModel.fromJson(json["location"]),
      email: json["email"] ?? "",
      login: LoginModel.fromJson(json["login"]),
      age: json["dob"]["age"] ?? 0,
      phone: json["phone"] ?? "",
      picture: json["picture"]["large"] ?? "",
    );
  }
}
