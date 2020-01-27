import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';

double getLength(BuildContext context, double padding, int N) {
  var size = MediaQuery.of(context).size;
  return (min(size.width, size.height) - (2 * padding)) / N;
}

List<int> freeIndecies(List<int> state) {
  List<int> list = new List();
  for (int i = 0; i < state.length; i++) {
    if (state[i] == 0 || state[i] == null) {
      list.add(i);
    }
  }
  return list;
}

List<int> initState(int N) {
  var random = new Random();
  List<int> list = new List<int>(N * N);
  for (var i = 0; i < 3; i++) {
    int val = i == 0 ? 2 : 1;
    while (true) {
      int index = random.nextInt(list.length);
      if (list[index] == null) {
        list[index] = val;
        break;
      }
    }
  }
  return list;
}

List<int> indexToRowAndColumn(int index, int N) {
  int row = index ~/ N;
  int column = index % N;
  List<int> list = new List(2);
  list[0] = row;
  list[1] = column;
  return list;
}

class BFSResult {
  bool isConnected;
  List<int> path;
  BFSResult(this.isConnected, {this.path});
}

BFSResult breadthFirstSearch(List<int> state, int N, int from, int to) {
  Queue q = new Queue();
  HashSet<int> visited = new HashSet();
  HashMap<int, int> visitedBy = new HashMap();
  q.add(from);
  visited.add(from);
  visitedBy.putIfAbsent(from, () => from);

  while (q.isNotEmpty) {
    int thisIndex = q.removeFirst();
    if (thisIndex == to) {
      break;
    }
    List<int> neighbours = _tilesMovableNeighbours(state, N, thisIndex, to);
    for (var neighbour in neighbours) {
      if (!visited.contains(neighbour)) {
        q.add(neighbour);
        visited.add(neighbour);
        visitedBy.putIfAbsent(neighbour, () => thisIndex);
      }
    }
  }
  List<int> path;
  var isConnected = visited.contains(to);
  if (isConnected) {
    List<int> history = new List();
    history.add(to);

    var current = visitedBy.remove(to);
    while (current != null) {
      history.add(current);
      current = visitedBy.remove(current);
    }

    history.add(from);

    path = new List();
    for (var index in history.reversed) {
      path.add(index);
    }
  }

  return new BFSResult(isConnected, path: path);
}

/// Get a tile's neighbours
/// allowedIndex is will not be excluded if found
List<int> _tilesMovableNeighbours(
    List<int> state, int N, int index, int allowedIndex) {

  var possible = _tilesPossibleNeighbours(state, N, index);
  List<int> list = new List();
  for (var index in possible) {
    if (index == allowedIndex) {
      list.add(index);
      continue;
    }
    var val = state[index];
    if (val == null || val == 0) {
      list.add(index);
    }
  }
  return list;
}


List<int> _tilesPossibleNeighbours(List<int> state, int N, int index) {
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

  return possible;
}

// TODO: There is a lot of potential to optimize
// And should probably be done, as this is in a hot path
bool isGameOver(List<int> state, int N) {
  for (int i = 0; i < state.length; i++) {
    var toCompare = state[i];
    var possibleMoves = _tilesPossibleNeighbours(state, N, i);
    for (var index in possibleMoves) {
      var val = state[index];
      if (val == toCompare || val == null || val == 0) {
        return false;
      }
    }
  }
  return true;
}
