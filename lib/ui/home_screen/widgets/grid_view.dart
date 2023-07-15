import 'package:flutter/material.dart';

import '../../../data/models/valorant_model/valorant_model.dart';

class GridViewForGame extends StatefulWidget {
  const GridViewForGame({super.key, required this.games});

  final List<ValorantModel> games;

  @override
  State<GridViewForGame> createState() => _GridViewForGameState();
}

class _GridViewForGameState extends State<GridViewForGame> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          crossAxisCount: 2,
          childAspectRatio: .72,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: List.generate(widget.games.length, (index) {
            return getContainers(title: widget.games[index].displayName, devName: widget.games[index].developerName, image: widget.games[index].displayIcon, colors: widget.games[index].colors);
          }),
        ));
  }

  Widget getContainers({
    required String title, required String devName, required String image, required List<
        dynamic> colors,}) {
    final one = Color(int.parse(colors[0], radix: 16)).withOpacity(1.0);
    final two = Color(int.parse(colors[1], radix: 16)).withOpacity(1.0);
    final three = Color(int.parse(colors[2], radix: 16)).withOpacity(1.0);
    final four = Color(int.parse(colors[3], radix: 16)).withOpacity(1.0);
    // String first = colors[0];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 140,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [one, two, three, four],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0,4,8,9],
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
                width: double.infinity,
                height: 170,
                child: Image.network(image, fit: BoxFit.cover)),
          ),
          RichText(text: TextSpan(
            text: "Name: ",
            style: TextStyle(
              fontSize: 14, color: Colors.black.withOpacity(.7),
            ),
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                )
              )
            ]
          )),
          RichText(text: TextSpan(
            text: "Developer name: ",
            style: TextStyle(
              fontSize: 14, color: Colors.black.withOpacity(.7),
            ),
            children: [
              TextSpan(
                text: devName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                )
              )
            ]
          ))
        ],
      ),
    );
  }
}
