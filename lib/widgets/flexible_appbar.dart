import 'dart:async';
import 'dart:convert';
import 'dart:math';
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

    // return FutureBuilder(
    //   future: DefaultAssetBundle.of(context).loadString('json/quotes.json'),
    //   // ignore: missing_return
    //   builder: (context, snapshot) {
    //     var quote = json.decode(snapshot.data.toString());
    //     if (snapshot.hasData) {
    return Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: data == null
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.orange[400],
            ))
          : SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Quote of the day",
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
                  ],
                ),
              ),
            ),
      decoration: new BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/bg.png"),
        ),
      ),
    );
  }
  //     },
  //   );
  // }
}
