import 'package:flutter/material.dart';
class GameScoreBox extends StatelessWidget {
  final String title;
  final String value;


  GameScoreBox({@required this.title,@required this.value});

  @override
  Widget build(BuildContext context) => new Column(
    children: <Widget>[
      new Text(this.title),
      new Text(this.value),
    ],
  );
}