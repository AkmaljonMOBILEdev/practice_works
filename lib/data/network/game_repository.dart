import 'package:main_project/data/models/universal_data.dart';
import 'package:main_project/data/models/valorant_model/valorant_model.dart';
import 'package:main_project/data/network/api_provider.dart';

class GameRepository {
  Future<List<ValorantModel>> fetchGameDetails() async {
    UniversalData universalData = await ApiProvider().getGameDetails();
    if(universalData.error.isEmpty){
      return universalData.data as List<ValorantModel>;
    }
    return [];
  }
}