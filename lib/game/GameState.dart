import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:nine/game/GameUtils.dart';

class GameState with ChangeNotifier {
  final int N;
  GameStatus gameStatus = GameStatus.running;
  List<int> tileState;
  int selectedIndex;

  GameState(this.N) : tileState = initState(N);

  onTileTab(int index) {
    if (selectedIndex == null && tileState[index] != null) {
      selectedIndex = index;
      notifyListeners();
    } else if (selectedIndex == null && tileState[index] == null) {
      return;
    } else if (selectedIndex == index) {
      selectedIndex = null;
      notifyListeners();
    } else {
      _tryMerge(selectedIndex, index);
    }
  }

  _addTile() {
    var random = new Random();
    List<int> indecies = freeIndecies(tileState);
    if (indecies.length == 0) {
      throw new ErrorDescription("Game Over state not handled");
    }
    var indexToIndex = random.nextInt(indecies.length);
    var index = indecies[indexToIndex];
    tileState[index] = 1;
    notifyListeners();
  }

  _tryMerge(int fromIndex, int toIndex) {
    // TODO
  }
}

enum GameStatus {
  running,
  over,
}
