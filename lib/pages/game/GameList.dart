/*
/   0   1      2      3      4     5    ....
--+-------------------------------------------
0 | 0   1      2      3      4     ... (N-1)
1 | N  (N+1)  (N+2)  (N+3)  (N+4)  ... (2N - 1)
2 | 2N (2N+1) (2N+2) (2N+3) (2N+4) ... (3N - 1)
3 | ...........................................
4 | ((N-1)N) ..................................
 */

import 'dart:collection';

import 'package:flutter/cupertino.dart';

class GameList {
  final int N;
  final List<int> gameState; // see first comment in file
  final Queue<List<int>> taskQueue = new Queue();

  GameList(this.N) : gameState = _generateInitialState(N);

  /// Returns whether move is legal and executed
  bool move(int fromRow, int fromColumn, int toRow, int toColumn) {
    var fromIndex = _indexOf(fromRow, fromColumn);
    var toIndex = _indexOf(toRow, toColumn);

    if (gameState[fromIndex] != gameState[toIndex]) {
      return false;
    }

    var res = _bfs(fromIndex, toIndex);
    debugPrint("[NINE] [GAME LIST] [move()] res: " + res.toString());
    if (!res.isConnected) {
      return false;
    }

    int prevIndex;
    for (int index in res.path) {
      if (prevIndex == null) {
        prevIndex = index;
        continue;
      }
      taskQueue.add([prevIndex, index]);
      gameState[fromIndex] = 0;
      gameState[toIndex]++;
    }
    return true;
  }

  /// Does a breadth-first search from index a to b
  BFSResult _bfs(int a, int b) {
    Queue q = new Queue();
    HashSet<int> visited = new HashSet();
    HashMap<int, int> visited_by = new HashMap();

    visited.add(a);
    visited_by.putIfAbsent(a, () => a);

    while (q.isNotEmpty) {
      int thisIndex = q.removeFirst();
      if (thisIndex == b) {
        break;
      }
      List<int> neighbours = _tilesMovableNeighbours(thisIndex, b);
      for (var neighbour in neighbours) {
        if (!visited.contains(neighbour)) {
          q.add(neighbour);
          visited.add(neighbour);
          visited_by.putIfAbsent(neighbour, () => thisIndex);
        }
      }
    }
    List<int> path = null;
    var isConnected = visited.contains(b);
    if (isConnected) {
      List<int> history = new List();
      history.add(b);

      var current = visited_by.remove(b);
      while (current != null) {
        history.add(current);
        current = visited_by.remove(current);
      }

      history.add(a);

      path = new List(history.length);
      for (var index in history.reversed) {
        path.add(index);
      }
    }

    return new BFSResult(isConnected, path);
  }

  /// Get a tile's neighbours
  /// allowedIndex is will not be excluded if found
  List<int> _tilesMovableNeighbours(int index, int allowedIndex) {
    var isAtLeftBorder = index % N == 0;
    var isAtRightBorder = (index + 1) % N == 0;
    var isAtTopBorder = index - N < 0;
    var isAtBottomBorder = index >= (N * N) - N;

    List<int> possible = new List();
    if (!isAtLeftBorder) {
      possible.add(index - 1);
    }
    if (!isAtRightBorder) {
      possible.add(index + 1);
    }
    if (!isAtTopBorder) {
      possible.add(index - N);
    }
    if (!isAtBottomBorder) {
      possible.add(index + N);
    }

    List<int> list = new List();
    for (var index in possible) {
      if (index == allowedIndex) {
        list.add(index);
        continue;
      }
      var val = gameState[index];
      if (val == null || val == 0) {
        list.add(index);
      }
    }
    return list;
  }

  /// 0-indexed
  int _indexOf(int row, int column) {
    return row * N + column;
  }

  static List<int> _generateInitialState(int N) {
    return new List(N * N);
  }
}

class BFSResult {
  final bool isConnected;
  final List<int> path;

  BFSResult(this.isConnected, this.path);
}
