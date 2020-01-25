import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'GameState.dart';
import 'GameTile.dart';
import 'GameUtils.dart';

class GameFieldSelectedLayer extends StatefulWidget {
  final int N;
  final double len;
  GameFieldSelectedLayer(this.N, this.len);

  @override
  _GameFieldSelectedLayerState createState() => _GameFieldSelectedLayerState();
}

class _GameFieldSelectedLayerState extends State<GameFieldSelectedLayer> {
  GameState gameState;
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    gameState = Provider.of<GameState>(context);
    if (gameState.selectedIndex == null) {
      setState(() {
        opacity = 0.0;
      });
    } else {
      setState(() {
        opacity = 0.3;
      });
    }
    var p = new IgnorePointer(
      ignoring: true,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: opacity,
        child: new Stack(
          children: <Widget>[
            for (int i = 0; i < gameState.tileState.length; i++)
              _gameTile(gameState, i),
          ],
        ),
      ),
    );
    return p;
  }

  Widget _gameTile(GameState gameState, int index) {
    List<int> rowAndColumn = indexToRowAndColumn(index, this.widget.N);
    int row = rowAndColumn[0];
    int column = rowAndColumn[1];
    int value = gameState.tileState[index];

    if (gameState.selectedIndex != index) {
      value = null;
    }
    return new GameTile(
      row,
      column,
      this.widget.len,
      value,
      greyedOut: value != null,
    );
  }
}
