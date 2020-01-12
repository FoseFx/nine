import 'package:flutter/material.dart';
import 'package:nine/game/GameField.dart';
import 'package:nine/game/GameState.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider<GameState>(
      create: (_) => new GameState(),
      child: new Scaffold(
        body: new GameField(),
      ),
    );
  }
}
