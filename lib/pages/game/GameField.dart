import 'package:flutter/material.dart';
import 'package:nine/pages/game/GameList.dart';
import 'package:nine/pages/game/GameMainTiles.dart';
import 'dart:math';

import 'package:nine/pages/game/GamePlaceholderTiles.dart';

class GameField extends StatefulWidget {
  final GameFieldState state = new GameFieldState();

  void oneBackInHistory() => state.oneBackInHistory();

  State createState() => state;
}

class GameFieldState extends State<GameField> {
  static final int N = 5;
  Function onGameEnd;
  Function onPointMade;
  GameList gameList = new GameList(N);

  int selectedRow;
  int selectedColumn;

  void oneBackInHistory() {}

  Widget build(BuildContext context) {
    var edgeLength = min(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    debugPrint("[NINE] [GAME FIELD] EdgeLength: " + edgeLength.toString());
    const padding = 4.0;
    var fieldSize = edgeLength - (2 * padding);
    return new Container(
      padding: EdgeInsets.all(padding),
      width: edgeLength,
      height: edgeLength,
      child: new Stack(
        children: <Widget>[
          new GamePlaceHolderTiles(N, fieldSize),
          new GameMainTiles(N, fieldSize, gameList, onTileSelected),
          new Text("Selcted Row, Column: " + selectedRow.toString() + ", " + selectedColumn.toString()),
        ],
      ),
    );
  }
  bool move(int fromRow, int fromColumn, int toRow, int toColumn) {
    var res;
    setState(() {
      res = gameList.move(fromRow, fromColumn, toRow, toColumn);
    });
    return res;
  }

  void onTileSelected(int row, int column) {
    if (selectedColumn != null) {
      move(selectedRow, selectedColumn, row, column);
      setState(() {
        selectedColumn = null;
        selectedRow = null;
      });
      return;
    }
    setState(() {
      selectedRow = row;
      selectedColumn = column;
    });
  }
}
