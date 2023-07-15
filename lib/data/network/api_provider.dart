import 'dart:convert';
import 'package:main_project/data/models/pokemon_model.dart';
import 'package:main_project/data/network/universal_data.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<UniversalData> getPokemonGames() async {
    Uri uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    try {
      http.Response response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)["pokemon"];
        List<PokemonModel> pokemonList = jsonData.map((json) =>
            PokemonModel.fromJson(json)).toList();
        return UniversalData(data: pokemonList);
      }
      return UniversalData(error: "Error");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}