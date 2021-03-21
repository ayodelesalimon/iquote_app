import 'dart:async';

import 'package:flut/screens/home/home_controller.dart';
import 'package:flut/screens/home/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ), //MaterialPageRoute
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Splash(),
        ), //MaterialPageRoute
      );
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 1), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
