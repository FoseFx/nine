import 'package:flutter/material.dart';
import 'package:nine/game/GameState.dart';
import 'package:nine/game/GameTile.dart';
import 'package:nine/game/GameUtils.dart';
import 'package:provider/provider.dart';

class GameFieldMainLayer extends StatelessWidget {
  final int N;
  final double len;
  const GameFieldMainLayer(this.N, this.len);

  @override
  Widget build(BuildContext context) {
    final GameState gameState = Provider.of<GameState>(context);
    return new Stack(
      children: <Widget>[
        for (int i = 0; i < gameState.tileState.length; i++)
          _gameTile(i,gameState.tileState[i]),
      ],
    );
  }

  Widget _gameTile(int index, int value) {
    List<int> rowAndColumn = indexToRowAndColumn(index, N);
    print("index: " + index.toString() + " row: " + rowAndColumn[0].toString() + " column: " + rowAndColumn[1].toString() + " value: " + value.toString());
    return new GameTile(rowAndColumn[0], rowAndColumn[1], len, value);
  }
}
