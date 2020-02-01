import 'package:flutter/material.dart';
import 'package:nine/game/GameFieldBackgroundLayer.dart';
import 'package:nine/game/GameFieldMainLayer.dart';
import 'package:nine/game/GameFieldSelectedLayer.dart';
import 'package:nine/game/GameOverLayer.dart';
import 'package:nine/game/GameUtils.dart';
import 'package:provider/provider.dart';

import 'GameState.dart';

class GameField extends StatelessWidget {
  final int N;
  final double padd = 8.0;
  const GameField(this.N);

  @override
  Widget build(BuildContext context) {
    final GameState gameState = Provider.of<GameState>(context);
    final length = _getLength(context);
    return new Padding(
      padding: new EdgeInsets.all(padd),
      child: SizedBox(
        height: length * N,
        width: length * N,
        child: new Stack(
          children: <Widget>[
            new GameFieldBackgroundLayer(N, padd),
            new GameFieldMainLayer(N, length),
            new GameFieldSelectedLayer(N, length),
            new GameOverLayer(
              N,
              length,
              gameState.gameStatus == GameStatus.over,
            ),
            new Text("SelectedIndex: " + gameState.selectedIndex.toString()),
          ],
        ),
      ),
    );
  }

  double _getLength(BuildContext context) => getLength(context, padd, N);
}
