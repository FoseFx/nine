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
import 'dart:math';

import 'package:flutter/cupertino.dart';

const int seed = 4;

class GameList {
  final Random random = new Random(seed);
  final int N;
  final List<int> gameState; // see first comment in file
  final Queue<List<int>> taskQueue = new Queue();

  int newValue; // indicates the index of the newest value

  GameList(this.N) : gameState = _generateInitialState(N);

  /// Returns whether move is legal and executed
  bool move(int fromRow, int fromColumn, int toRow, int toColumn) {
    var fromIndex = indexOf(fromRow, fromColumn);
    var toIndex = indexOf(toRow, toColumn);
    debugPrint("[NINE][GAME LIST] move() fromIndex " + fromIndex.toString());
    debugPrint("[NINE][GAME LIST] move() toIndex " + toIndex.toString());
    debugPrint("[NINE][GAME LIST] move() gameState " + gameState.toString());

    if (fromIndex == toIndex) {
      return false;
    }

    if (gameState[fromIndex] != gameState[toIndex] && gameState[toIndex] != null) {
      return false;
    }

    var res = _bfs(fromIndex, toIndex);
    debugPrint("[NINE] [GAME LIST] [move()] res: " + res.isConnected.toString());
    if (!res.isConnected) {
      return false;
    }

    taskQueue.add(res.path);
    if (gameState[toIndex] == null) {
      gameState[toIndex] = gameState[fromIndex];
    } else {
      gameState[toIndex]++;
    }
    gameState[fromIndex] = null;
    _addNewTile();
    return true;
  }

  /// Does a breadth-first search from index a to b
  BFSResult _bfs(int a, int b) {
    Queue q = new Queue();
    HashSet<int> visited = new HashSet();
    HashMap<int, int> visitedBy = new HashMap();

    q.add(a);
    visited.add(a);
    visitedBy.putIfAbsent(a, () => a);

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
          visitedBy.putIfAbsent(neighbour, () => thisIndex);
        }
      }
    }
    List<int> path;
    var isConnected = visited.contains(b);
    if (isConnected) {
      List<int> history = new List();
      history.add(b);

      var current = visitedBy.remove(b);
      while (current != null) {
        history.add(current);
        current = visitedBy.remove(current);
      }

      history.add(a);

      path = new List();
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
  int indexOf(int row, int column) {
    return row * N + column;
  }

  void _addNewTile() {
    List<int> list = _unusedIndexes(gameState);
    int randomIndex = random.nextInt(list.length);
    int index = list[randomIndex];
    gameState[index] = 1;
    newValue = index;
  }

  static List<int> _generateInitialState(int N) {
    Random random = new Random(seed);
    int nsq = N*N;
    List<int> l = new List(nsq);
    int index1 = random.nextInt(nsq);
    int index2 = random.nextInt(nsq);
    int index3 = random.nextInt(nsq);
    l[index1] = 1;
    l[index2] = 1;
    l[index3] = 2;
    return l;
  }

  static List<int> _unusedIndexes(List<int> list) {
    List<int> newlist = new List<int>();
    for (int i = 0; i < list.length; i++) {
      if (list[i] == null) {
        newlist.add(i);
      }
    }
    return newlist;
  }
}

class BFSResult {
  final bool isConnected;
  final List<int> path;

  BFSResult(this.isConnected, this.path);
}
