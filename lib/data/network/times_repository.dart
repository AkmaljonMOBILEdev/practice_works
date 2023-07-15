import 'package:main_project/data/models/prayer_times_model.dart';
import 'package:main_project/data/models/times_model.dart';
import 'package:main_project/data/network/api_provider.dart';
import 'package:main_project/data/network/universal_data.dart';

class TimesRepository{
  Future<PrayerTimesModel> fetchTimes(String region)async{
    UniversalData universalData = await ApiProvider().getTimes(region);
    print("second: ${universalData.data}");
    if(universalData.error.isEmpty){
      return universalData.data as PrayerTimesModel;
    }
    return PrayerTimesModel(region: "",date: "",weekday: "",times: TimesModel(tong: "",quyosh: "",peshin: "",asr: "",shom: "",xufton: ""));
  }
}