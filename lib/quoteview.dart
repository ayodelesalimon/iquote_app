import 'dart:ui';

import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  final String quote;

  const PageViewDemo({Key key, this.quote}) : super(key: key);
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          pageSnapping: false,
          controller: _controller,
          children: [
            MyPage1Widget(
              qoute: widget.quote,
            ),
            MyPage2Widget(
              qoute: widget.quote,
            ),
            MyPage3Widget(
              qoute: widget.quote,
            ),
            MyPage4Widget(
              qoute: widget.quote,
            ),
            MyPage5Widget(
              qoute: widget.quote,
            ),
          ],
        ),
      ),
    );
  }
}

class MyPage1Widget extends StatelessWidget {
  final String qoute;

  const MyPage1Widget({Key key, this.qoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MyBox(
            mediumGreen,
            text: qoute,
            img: "assets/mini.jpg",
          ),
        ],
      ),
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  final String qoute;

  const MyPage2Widget({Key key, this.qoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyBox(
          mediumBlue,
          text: qoute,
          img: "assets/bat.jpg",
        ),
      ],
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  final String qoute;

  const MyPage3Widget({Key key, this.qoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyBox(
          mediumRed,
          text: qoute,
          img: "assets/wak.jpg",
        ),
      ],
    );
  }
}

class MyPage5Widget extends StatelessWidget {
  final String qoute;

  const MyPage5Widget({Key key, this.qoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyBox(
          mediumRed,
          text: qoute,
          img: "assets/rock.png",
        ),
      ],
    );
  }
}

class MyPage4Widget extends StatelessWidget {
  final String qoute;

  const MyPage4Widget({Key key, this.qoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade400, Colors.deepOrange.shade900],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 40,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/2.png",
                      height: screenHeight * 0.45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 8),
                    child: Text(
                      qoute,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "- Ayodele Salimonu",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final String img;
  final double height;
  final String text;

  MyBox(this.color, {this.height, this.text, this.img});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(img),
          ),
        ),

        // margin: EdgeInsets.all(10),

        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 3),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              " “ ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Josefin',
                              ),
                            ),
                          ],
                        ),
                        Text(
                          text,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'Josefin',
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
