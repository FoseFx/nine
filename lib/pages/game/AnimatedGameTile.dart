import 'package:flutter/material.dart';

class AnimatedGameTile extends StatefulWidget {
  final Widget wrappedGameTile;
  AnimatedGameTile({Key key, this.wrappedGameTile}) : super(key: key);

  @override
  _AnimatedGameTileState createState() => _AnimatedGameTileState();
}

class _AnimatedGameTileState extends State<AnimatedGameTile>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: new Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = new Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animation = new CurvedAnimation(parent: _animation, curve: Curves.easeOut);
    _animation.addListener((){
      setState(() {});
    });
    _animationController.forward().then((_) {debugPrint("Animation done");}).catchError((e) {debugPrint("error: " + e);});
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      child: this.widget.wrappedGameTile,
      scale: _animation.value,
    );
  }
}
