// import 'package:flutter/material.dart';
// import 'package:main_project/data/network/rep.dart';
//
// import '../../data/models/pokemon_model.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   List<PokemonModel> games = [];
//   PokemonRep pokemonRep = PokemonRep();
//   bool isLoading=false;
//
//   @override
//   void initState() {
//     // _fetchData();
//
//     super.initState();
//   }
//   _fetchData()async{
//     setState(() {
//       isLoading=true;
//     });
//     games = await pokemonRep.fetch();
//     setState(() {
//       isLoading=false;
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Center(child: Text('Games')),
//             ...List.generate(games.length, (index){
//               return ListTile(
//                 title: Text(games[index].name),
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
