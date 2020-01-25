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
          _gameTile(gameState, i),
      ],
    );
  }

  Widget _gameTile(GameState gameState, int index) {
    List<int> rowAndColumn = indexToRowAndColumn(index, N);
    int row = rowAndColumn[0];
    int column = rowAndColumn[1];
    int value = gameState.tileState[index];

    return new GameTile(
      row,
      column,
      len,
      value,
      onTapFn: () => gameState.onTileTab(index),
    );
  }
}
