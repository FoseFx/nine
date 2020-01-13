import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:nine/game/GameUtils.dart';

class GameState with ChangeNotifier {
  final int N;
  GameStatus gameStatus = GameStatus.running;
  List<int> tileState;

  GameState(this.N) : tileState = initState(N);

  _addTile() {
    var random = new Random();
    List<int> indecies = freeIndecies(tileState);
    var indexToIndex = random.nextInt(indecies.length);
    var index = indecies[indexToIndex];
    tileState[index] = 1;
  }
}

enum GameStatus {
  running,
  over,
}
