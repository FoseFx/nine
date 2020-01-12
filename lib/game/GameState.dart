
import 'package:flutter/widgets.dart';

class GameState with ChangeNotifier {
  int N;
  List<int> tileState = new List();

  GameState({this.N = 5});

}
