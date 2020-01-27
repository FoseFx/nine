import 'package:flutter/material.dart';
import 'package:nine/game/GameState.dart';
import 'package:provider/provider.dart';

class GameOverLayer extends StatelessWidget {
  final bool show;
  final int N;
  final double len;
  const GameOverLayer(this.N, this.len, this.show);

  @override
  Widget build(BuildContext context) {
    GameState gameState = Provider.of<GameState>(context);
    return show
        ? new Container(
            height: len * N,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Color.fromARGB(100, 0, 0, 0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Game Over",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  new FlatButton(
                    onPressed: gameState.reset(),
                    child: new Text("Play Again"),
                  ),
                ],
              ),
            ),
          )
        : new IgnorePointer();
  }
}
