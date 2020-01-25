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
