import 'package:flutter/material.dart';
import 'package:nine/game/GameField.dart';
import 'package:nine/game/GameState.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  final int N = 3;

  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider<GameState>(
      create: (_) => new GameState(N),
      lazy: false,
      child: new Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: new GameField(N),
            ),
          ],
        ),
      ),
    );
  }
}
