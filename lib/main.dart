import 'package:admob_flutter/admob_flutter.dart';
import 'package:flut/screens/home/intro.dart';
import 'package:flutter/material.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
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
      home: Intro(),
    );
  }
}
