import 'package:flutter/material.dart';
import 'package:main_project/ui/widgets/searchedItem.dart';

import '../../models/game_model.dart';

class GameSearchDelegate extends SearchDelegate {
  GameSearchDelegate({required this.suggestionList});
  final List<GameModel> suggestionList;



  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, query);
      },
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context)
    {
      List<GameModel> searchedGames = suggestionList.where((element){
        final result = element.title.toLowerCase();
        final input = query.toLowerCase();
        return result.contains(input);
      }).toList();
      return ListView.builder(
          itemCount: searchedGames.length,
          itemBuilder: (BuildContext context, int index){
            return SearchedItem(gameModel: searchedGames[index]);
          });
    }
}
