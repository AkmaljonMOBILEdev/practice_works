import 'package:main_project/data/networks/api_provider.dart';
import 'package:main_project/models/game_model.dart';
import 'package:main_project/models/universal_response.dart';

class GameRepository{
  final ApiProvider apiProvider;
  GameRepository({required this.apiProvider});

  Future<List<GameModel>> fetchGames()async{
    UniversalResponse universalResponse = await apiProvider.getAllGames();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<GameModel>;
    }
    return [];
  }
}