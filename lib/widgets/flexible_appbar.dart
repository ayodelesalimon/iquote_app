import 'dart:async';
import 'dart:math';

import 'package:flut/screens/favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class MyFlexiableAppBar extends StatefulWidget {
  const MyFlexiableAppBar();

  @override
  _MyFlexiableAppBarState createState() => _MyFlexiableAppBarState();
}

class _MyFlexiableAppBarState extends State<MyFlexiableAppBar> {
  final double appBarHeight = 66.0;

  var greeting = "jjjjj";
  var greet = "llllll";
  var index = Random().nextInt(2);

  List name = ["Ayodele", "Shade", "Bukky", "Tola"];
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Timer(Duration(seconds: 5), () {
    //   setState(() {
    //     greeting = name[index];
    //   });
    // });

    // Timer.periodic(Duration(seconds: 5), (timer) {
    // if (DateTime.now().second == 4) {
    //   //Stop if second equal to 4
    //   timer.cancel();
    // }
    //   setState(() {
    //     greet = name[index];
    //   });
    // });

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 350),
                    pageBuilder: (context, _, __) => FavoriteQuotes()),
              );
            },
            icon: Icon(Icons.favorite),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Quote of the day",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins',
                        fontSize: 28.0)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        greet,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        greeting,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/bg.png"),
        ),
      ),
    );
  }
}
