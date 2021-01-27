import 'package:flut/screens/home/home_controller.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(elevation: 0, color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
