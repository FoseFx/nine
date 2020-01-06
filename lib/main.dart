import 'package:flutter/material.dart';
import 'package:nine/pages/PageRoutes.dart';
import 'package:nine/pages/game/GamePage.dart';
import 'package:nine/pages/splash/SplashPage.dart';
import 'package:nine/pages/tutorial/TutorialPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        PAGE_ROUTE_SPLASH: (_) => new SplashPage(),
        PAGE_ROUTE_GAME: (_) => new GamePage(),
        PAGE_ROUTE_TUTORIAL: (_) => new TutorialPage(),
      },
      initialRoute: PAGE_ROUTE_SPLASH,
    );
  }
}
