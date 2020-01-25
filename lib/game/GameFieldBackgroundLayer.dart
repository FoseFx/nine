import 'package:flutter/material.dart';
import 'package:nine/game/GameTile.dart';
import 'package:nine/game/GameUtils.dart';

class GameFieldBackgroundLayer extends StatelessWidget {
  final int N;
  final double padding;
  const GameFieldBackgroundLayer(this.N, this.padding);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: new Stack(
        children: <Widget>[
          for (int r = 0; r < N; r++)
            for (int c = 0; c < N; c++)
              new GameTile(r, c, getLength(context, padding, N), -1)
        ],
      ),
    );
  }
}
