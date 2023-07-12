
import 'dart:convert';

import 'package:http/http.dart';
import 'package:main_project/data/models/prayer_times_model.dart';
import 'package:main_project/utils/constants.dart';

class ApiProvider{
  
  Future<PrayerTimesModel?> getTimes(String region)async{
    Uri uri = Uri.parse("$baseUrlOfRegion=$region");
    Response response = await get(uri);

    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return PrayerTimesModel.fromJson(data);
    }
    return null;
  }
  
}