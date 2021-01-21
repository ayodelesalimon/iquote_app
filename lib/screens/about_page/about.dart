import 'package:flut/widgets/flexible_appbar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              child: Center(
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/black.png"),
                ),
              ),
            ),
            Positioned(
              left: 27,
              top: 170,
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: 27,
              top: 420,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: ListTile(
                    leading: Icon(Icons.accessible),
                  ),
                  width: 360,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 27,
              top: 295,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 360,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
