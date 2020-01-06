import 'package:flutter/material.dart';

class GameControlls extends StatelessWidget {
  final Function onReset;
  final Function onOneBack;

  GameControlls({@required this.onReset, @required this.onOneBack});

  @override
  Widget build(BuildContext context) => new Row(
        children: <Widget>[
          new MaterialButton(
            onPressed: this.onOneBack,
            child: new Icon(Icons.keyboard_backspace),
          ),
          new MaterialButton(
            onPressed: this.onReset,
            child: new Icon(Icons.refresh),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      );
}
