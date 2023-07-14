import 'package:main_project/data/models/pokemon_model.dart';
import 'package:main_project/data/network/api_provider.dart';
import 'package:main_project/data/network/universal_data.dart';

class PokemonRep{
  Future<List<PokemonModel>> fetchData()async{
    UniversalData universalData = await ApiProvider.getPokemonGames();
    if(universalData.error.isEmpty){
      return universalData.data as List<PokemonModel>;
    }
    return [];
  }
}