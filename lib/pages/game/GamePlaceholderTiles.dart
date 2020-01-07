import 'package:flutter/material.dart';
import 'package:nine/pages/game/GameTile.dart';

class GamePlaceHolderTiles extends StatelessWidget {
  final int N; // a field is n*n
  final double fieldLength;

  GamePlaceHolderTiles(this.N, this.fieldLength);

  @override
  Widget build(BuildContext context) => new Column(
        children: <Widget>[
          for (var i = 0; i < N; i++)
            new Row(
              children: <Widget>[
                for (var j = 0; j < N; j++)
                  new GameTile(
                    length: (fieldLength / N) * 0.88,
                    backgroundColor: Colors.grey,
                  ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      );
}
