import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/data/networks/api_provider.dart';
import 'package:main_project/data/networks/game_repository.dart';
import 'package:main_project/ui/game_screen/game_screen.dart';

import '../../models/game_model.dart';
import '../widgets/search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GameRepository gameRepository =
      GameRepository(apiProvider: ApiProvider());
  List<GameModel> games = [];
  bool isLoading = false;
  String searchText="";

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
    print('Games are ------------------- ${games.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.amberAccent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
          actions: [
            IconButton(
              onPressed: ()async {
                searchText = await showSearch(context: context, delegate: GameSearchDelegate(suggestionList: games));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Text(
                      'All games',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: games.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
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
              ));
  }
}
