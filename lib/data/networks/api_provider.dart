import 'dart:convert';
import 'package:main_project/models/game_model.dart';
import '../../models/universal_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider{
  Future<UniversalResponse> getAllGames()async{
    Uri uri = Uri.parse("https://www.freetogame.com/api/games");
    try{
      http.Response response = await http.get(uri);
      if(response.statusCode==200){
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => GameModel.fromJson(e)).toList()??[]);

      }
      return UniversalResponse(error: 'Error');
    }catch(error){
      return UniversalResponse(error: error.toString());
    }
  }
}