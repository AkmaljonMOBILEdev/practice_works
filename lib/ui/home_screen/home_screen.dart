import 'package:flutter/material.dart';
import 'package:main_project/data/models/valorant_model/valorant_model.dart';
import 'package:main_project/data/network/game_repository.dart';
import 'package:main_project/ui/home_screen/widgets/categories.dart';
import 'package:main_project/ui/home_screen/widgets/grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GameRepository gameRepository = GameRepository();
  List<ValorantModel> games = [];
  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    games = await gameRepository.fetchGameDetails();
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
      appBar: AppBar(),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  TopCategories(),
                  SizedBox(height: 20,),
                  GridViewForGame(games: games)
                ],
              ));
  }
}
