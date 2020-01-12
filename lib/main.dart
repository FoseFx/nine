import 'package:flutter/material.dart';

import 'game/GamePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nine',
      routes: {
        "/gameRoute": (_) => new GamePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/gameRoute",
    );
  }
}
