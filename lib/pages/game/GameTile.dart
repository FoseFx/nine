import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final double length;
  final Color backgroundColor;
  final int value;

  GameTile({
    @required this.length,
    @required this.backgroundColor,
    this.value,
  });

  @override
  Widget build(BuildContext context) => new Container(
        width: length,
        height: length,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(
            Radius.circular(length * 0.1),
          ),
          color: backgroundColor,
        ),
        child: this.value == null
            ? null
            : new Center(
                child: new Text(
                  this.value.toString(),
                ),
              ),
      );
}
