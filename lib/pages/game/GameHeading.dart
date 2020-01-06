import 'package:flutter/material.dart';
import 'package:nine/pages/game/GameScoreBox.dart';

class GameHeading extends StatelessWidget {
  final int score;
  final int highScore;

  GameHeading({@required this.score, @required this.highScore});

  @override
  Widget build(BuildContext context) => new Row(
        children: <Widget>[
          new Text("Nine Game"),
          new Spacer(),
          new GameScoreBox(
            title: "Score",
            value: this.score.toString(),
          ),
          new GameScoreBox(
            title: "Highscore",
            value: this.highScore.toString(),
          ),
        ],
      );
}
