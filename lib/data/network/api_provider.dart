import 'dart:convert';

import 'package:main_project/data/models/valorant_model/valorant_model.dart';

import '../models/universal_data.dart';
import 'package:http/http.dart' ;

class ApiProvider{
  Future<UniversalData> getGameDetails()async{
    
    Uri uri = Uri.parse("https://valorant-api.com/v1/agents");

    try{
      Response response = await get(uri);
      print('first: ${response.body}');
      if(response.statusCode==200){
        List<dynamic> jsonData = jsonDecode(response.body)["data"];
        List<ValorantModel> gameList = jsonData.map((e) => ValorantModel.fromJson(e)).toList();
        return UniversalData(data: gameList);
      }
      return UniversalData(error: "Error");

    }catch(e){
      return UniversalData(error: e.toString());
    }
    
  }
}