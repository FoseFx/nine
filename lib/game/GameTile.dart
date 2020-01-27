import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final double length;
  final double padding;
  final int row;
  final int col;
  final int value;
  final Function onTapFn;
  final bool greyedOut;
  const GameTile(this.row, this.col, this.length, this.value, {this.onTapFn, this.greyedOut = false})
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
        child: new InkWell(
          onTap: onTapFn,
          child: new Material(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: _getBGColor(greyedOut),
            child: value == -1
                ? null
                : Center(
                    child: new Text(
                      value.toString(),
                      style: new TextStyle(
                        color: _getFGColor(greyedOut),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Color _getBGColor(bool greyedOut) {
    if (greyedOut) {
      return Colors.black;
    }
    var res = _BG_COLORS[this.value];
    if (res == null) {
      return Colors.black;
    } else {
      return res;
    }
  }

  Color _getFGColor(bool greyedOut) {
    if (greyedOut) {
      return Colors.white;
    }
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
  3: Colors.amber,
  4: Colors.cyan,
  5: Colors.deepPurple,
  6: Colors.indigo,
  7: Colors.lime,
  8: Colors.purple,
  9: Colors.yellow,
};

const _FG_COLORS = {
  -1: Colors.transparent,
  null: Colors.transparent,
  0: Colors.transparent,
  1: Colors.white,
  2: Colors.white,
  3: Colors.black,
  4: Colors.black,
  5: Colors.white,
  6: Colors.white,
  7: Colors.black,
  8: Colors.white,
  9: Colors.black,
};
