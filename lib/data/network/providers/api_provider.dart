import 'dart:convert';
import 'package:main_project/data/models/free_user_model/results_model/results_model.dart';

import '../../models/universal_data.dart';
import 'package:http/http.dart';
class ApiProvider{
  Future<UniversalData> getUserInfo()async{
    Uri uri = Uri.parse("https://randomuser.me/api/");
    try{
      Response response = await get(uri);
      if(response.statusCode==200){
        print("Data: ${response.body}");
        return UniversalData(
          data: (jsonDecode(response.body)["results"] as List<dynamic>?)
              ?.map((e) => ResultsModel.fromJson(e)).toList()??[]
        );
      }
      return UniversalData(error: "Error");

    }catch(e){
      return UniversalData(error: e.toString());
    }
  }
}