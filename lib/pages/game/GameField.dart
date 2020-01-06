import 'package:flutter/material.dart';
import 'dart:math';

class GameField extends StatefulWidget {
  final GameFieldState state = new GameFieldState();
  void oneBackInHistory() => state.oneBackInHistory();
  State createState() => state;
}

class GameFieldState extends State<GameField> {
  Function onGameEnd;
  Function onPointMade;

  void oneBackInHistory() {}
  Widget build(BuildContext context) {
    var edgeLength = min(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    return new Container(
      width: edgeLength,
      height: edgeLength,
      color: Colors.red,
    );
  }
}
