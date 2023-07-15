import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/data/network/rep.dart';
import 'package:main_project/ui/home_screen/widgets/game_banner.dart';
import 'package:main_project/ui/home_screen/widgets/search_button.dart';
import 'package:main_project/utils/icons.dart';

import '../../data/models/pokemon_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PokemonModel> games = [];
  PokemonRep pokemonRep = PokemonRep();
  bool isLoading = false;

  @override
  void initState() {
    _fetchData();

    super.initState();
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    games = await pokemonRep.fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 53.h,
            ),
            Center(
              child: SizedBox(
                width: 252.w,
                height: 88.h,
                child: Image.asset(
                  AppIcons.pokemon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const PokemonSearch(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                physics: const BouncingScrollPhysics(),
                itemCount: games.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 19.w,
                  mainAxisSpacing: 6.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GameBanner(
                    game: games[index],
                  );
                },
              ),
            ),
            SizedBox(height: 27.h,),
          ],
        ),
      ),
    );
  }

}
