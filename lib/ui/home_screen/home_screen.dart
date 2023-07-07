import 'package:flutter/material.dart';
import 'package:main_project/data/networks/api_provider.dart';
import 'package:main_project/data/networks/game_repository.dart';
import 'package:main_project/ui/game_screen/game_screen.dart';

import '../../models/game_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GameRepository gameRepository = GameRepository(
      apiProvider: ApiProvider());
  List<GameModel> games = [];
  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    games = await gameRepository.fetchGames();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: isLoading
            ? const Center(
                  child: CircularProgressIndicator(),)
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('All games', style: TextStyle(fontSize: 20),),
                ),
                Expanded(
                  child: ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return GameScreen(gameModel: games[index]);
                        }));

                      },
                      title: Text(games[index].title),
                      subtitle: Text(games[index].title),
                      trailing: const Icon(Icons.arrow_right),
                    );
                  }),
                ),
              ],
            )
    );
  }
}
