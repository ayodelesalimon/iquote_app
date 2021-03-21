import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flut/screens/quotes/quote_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFlexiableAppBar extends StatefulWidget {
  const MyFlexiableAppBar();

  @override
  _MyFlexiableAppBarState createState() => _MyFlexiableAppBarState();
}

class _MyFlexiableAppBarState extends State<MyFlexiableAppBar> {
  final double appBarHeight = 66.0;
  List data;
  var _index;

  // ignore: missing_return
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() => data = json.decode(jsonText));
  }

  @override
  void initState() {
    this.loadJsonData();
    _changeQuote();
    super.initState();
  }

  _changeQuote() {
    setState(
      () {
        _index = Random(_index).nextInt(3000);
      },
    );
  }

//  const oneSec = const Duration(seconds: 60);
//   new Timer.periodic(oneSec, (Timer t) => _changeQuote());

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: data == null
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.orange[400],
            ))
          : Stack(
              children: [
                // Positioned(
                //   top: -10,
                //   child: Align(
                //     alignment: Alignment.topLeft,
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: IconButton(
                //         color: Colors.white,
                //         iconSize: 30,
                //         icon: Icon(Icons.arrow_back_ios),
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             PageRouteBuilder(
                //                 transitionDuration: Duration(milliseconds: 100),
                //                 pageBuilder: (context, _, __) => Home()),
                //           );
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuoteDetails(
                                        author: data[_index]['Author'],
                                        quote: data[_index]['Quote'],
                                      )),
                            );
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                ),
                                Text("Random Quote",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Poppins',
                                        fontSize: 28.0)),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text(
                                        data == null
                                            ? "No quote"
                                            : data[_index]["Quote"],
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
                                        data == null
                                            ? "Quote"
                                            : data[_index]["Author"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
