import 'package:flutter/material.dart';
import 'package:nine/game/GameFieldBackgroundLayer.dart';
import 'package:nine/game/GameFieldMainLayer.dart';
import 'package:nine/game/GameFieldSelectedLayer.dart';
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

    return new Padding(
      padding: new EdgeInsets.all(padd),
      child: new Stack(
        children: <Widget>[
          new GameFieldBackgroundLayer(N, padd),
          new GameFieldMainLayer(N, _getLength(context)),
          new GameFieldSelectedLayer(N, _getLength(context)),
          new Text("SelectedIndex: " + gameState.selectedIndex.toString()),
        ],
      ),
    );
  }

  double _getLength(BuildContext context) => getLength(context, padd, N);
}
