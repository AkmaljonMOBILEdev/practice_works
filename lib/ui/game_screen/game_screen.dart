import 'package:flutter/material.dart';
import 'package:main_project/models/game_model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.gameModel});
  final GameModel gameModel;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
