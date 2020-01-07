import 'package:flutter/material.dart';
import 'package:nine/pages/game/GameList.dart';
import 'package:nine/pages/game/GameTile.dart';

class GameMainTiles extends StatelessWidget {
  final int N;
  final double fieldLength;
  final GameList gameState;
  final Function onSelect;

  GameMainTiles(this.N, this.fieldLength, this.gameState, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        for (var i = 0; i < N; i++)
          new Row(
            children: <Widget>[
              for (var j = 0; j < N; j++)
                new GameTile(
                  length: (fieldLength / N) * 0.88,
                  backgroundColor: bgColorOf(
                    gameState.gameState[gameState.indexOf(i, j)],
                  ),
                  value: gameState.gameState[gameState.indexOf(i, j)],
                  onSelect: () => {
                    onSelect(i, j),
                  },
                  foregroundColor: fgColorOf(
                    gameState.gameState[gameState.indexOf(i, j)],
                  ),
                )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Color bgColorOf(int value) {
    if (value == null) {
      return Colors.transparent;
    }
    switch (value) {
      case 1:
        return Colors.blueGrey;
      case 2:
        return Colors.cyan;
      case 3:
        return Colors.lightBlue;
      case 4:
        return Colors.blue;
      case 5:
        return Colors.lightGreen;
      case 6:
        return Colors.green;
      case 7:
        return Colors.red;
      case 8:
        return Colors.orange;
      case 9:
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  Color fgColorOf(int value) {
    if (value == null) {
      return Colors.transparent;
    }
    switch (value) {
      case 2:
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        return Colors.black;
      case 1:
      case 4:
      default:
        return Colors.white;
    }
  }
}