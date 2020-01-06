import 'package:flutter/material.dart';

import 'GameControlls.dart';
import 'GameField.dart';
import 'GameHeading.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _score = 0;
  int _highScore = 0;

  GameField _field = new GameField();

  @override
  Widget build(BuildContext context) => new Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new GameHeading(
                score: this._score,
                highScore: this._highScore,
              ),
              new GameControlls(
                onOneBack: _field.oneBackInHistory,
                onReset: this._onReset,
              ),
              _field,
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    _initFileFunctions();
  }

  void _onGameEnd() {}

  void _initFileFunctions() {
    _field.state.onPointMade = () {
      setState(() {
        _score++;
      });
    };
    _field.state.onGameEnd = this._onGameEnd;
  }

  void _onReset() {
    setState(() {
      _field = new GameField();
      _score = 0;
      _highScore = 0;
      _initFileFunctions();
    });
  }
}
