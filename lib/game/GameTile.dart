import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final double length;
  final double padding;
  final int row;
  final int col;
  final int value;
  const GameTile(this.row, this.col, this.length, this.value)
      : padding = length * 0.05;

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
          color: _getBGColor(),
          child: value == -1
              ? null
              : Center(
                  child: new Text(
                    value.toString(),
                    style: new TextStyle(
                      color: _getFGColor(),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Color _getBGColor() {
    var res = _BG_COLORS[this.value];
    if (res == null) {
      return Colors.black;
    } else {
      return res;
    }
  }

  Color _getFGColor() {
    var res = _FG_COLORS[this.value];
    if (res == null) {
      return Colors.white;
    } else {
      return res;
    }
  }
}

const _BG_COLORS = {
  -1: Colors.grey,
  null: Colors.transparent,
  0: Colors.transparent,
  1: Colors.green,
  2: Colors.blue,
};

const _FG_COLORS = {
  -1: Colors.transparent,
  null: Colors.transparent,
  0: Colors.transparent,
  1: Colors.white,
  2: Colors.white,
};
