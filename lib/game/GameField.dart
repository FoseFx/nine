import 'package:flutter/material.dart';
import 'dart:math';

class GameField extends StatelessWidget {
  final int N = 5;
  final double padd = 8.0;
  const GameField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: new EdgeInsets.all(padd),
      child: new Stack(
        children: <Widget>[
          new Square(0, 0, getLength(context), 12),
          new Square(0, 1, getLength(context), 12),
          new Square(0, 2, getLength(context), 12),
          new Square(0, 3, getLength(context), 12),
          new Square(0, 4, getLength(context), 12),
          new Square(1, 0, getLength(context), 12),
          new Square(1, 1, getLength(context), 12),
          new Square(1, 2, getLength(context), 12),
          new Square(1, 3, getLength(context), 12),
          new Square(1, 4, getLength(context), 12),
        ],
      ),
    );
  }

  double getLength(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return (min(size.width, size.height) - (2 * padd)) / N;
  }
}

class Square extends StatelessWidget {
  final double length;
  final double padding;
  final int row;
  final int col;
  final int value;
  const Square(this.row, this.col, this.length, this.value): padding = length * 0.05;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
          height: length,
          width: length,
          left: length * col,
          top: length * row,
          child: Container(
            margin: EdgeInsets.all(padding),
            child: new Material(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.red,
              child: Center(child: new Text(value.toString())),
            ),
          ),
        );
  }
}
