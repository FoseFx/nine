import 'package:flutter/material.dart';
import 'package:nine/pages/PageRoutes.dart';
import 'package:nine/prefKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  Widget build(BuildContext context) => new Scaffold(); // @TODO Meaningful content, when needed

  @override
  void initState() {
    super.initState();
    _onStartup();
  }

  void _onStartup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasCompletedTut = prefs.getBool(PREF_KEY_HAS_COMPLETED_TUTORIAL) ?? false;
    String newPage = hasCompletedTut ? PAGE_ROUTE_GAME : PAGE_ROUTE_TUTORIAL;
    // Navigator.of(context).pushReplacementNamed(newPage);
    Navigator.of(context).pushReplacementNamed(PAGE_ROUTE_GAME);
  }
}