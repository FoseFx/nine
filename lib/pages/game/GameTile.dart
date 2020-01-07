import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final double length;
  final Color backgroundColor;
  final Color foregroundColor;
  final int value;
  final Function onSelect;

  GameTile({
    @required this.length,
    @required this.backgroundColor,
    this.value,
    this.onSelect,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) => new InkWell(
        onTap: onSelect,
        child: new Container(
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
                    style: new TextStyle(color: foregroundColor),
                  ),
                ),
        ),
      );
}
