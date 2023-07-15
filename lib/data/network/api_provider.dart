
import 'dart:convert';

import 'package:http/http.dart';
import 'package:main_project/data/models/prayer_times_model.dart';
import 'package:main_project/data/models/times_model.dart';
import 'package:main_project/data/network/universal_data.dart';
import 'package:main_project/utils/constants.dart';

class ApiProvider{
  
  Future<UniversalData> getTimes(String region)async{
    Uri uri = Uri.parse("https://islomapi.uz/api/present/day?region=$region");
    Response response = await get(uri);
    print("first: ${response.body}");
    if(response.statusCode==200){
      return UniversalData(
        data: PrayerTimesModel.fromJson(jsonDecode(response.body))
      );
    }
    return UniversalData(error: "Error");

  }
  
}