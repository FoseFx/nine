import 'package:flutter/material.dart';
import 'package:nine/game/GameField.dart';
import 'package:nine/game/GameState.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  final int N = 5;

  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider<GameState>(
      create: (_) => new GameState(N),
      lazy: false,
      child: new Scaffold(
        body: new GameField(N),
      ),
    );
  }
}
