import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer_builder/timer_builder.dart';

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  DateTime alert;
  var _index;
  List data;

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() => data = json.decode(jsonText));
  }

  @override
  void initState() {
    this.loadJsonData();
    alert = DateTime.now().add(Duration(seconds: 10));

    super.initState();
  }

  @override
  void setState(fn) {
    _index = Random(_index).nextInt(3000);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    String sign = '"';
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: TimerBuilder.periodic(Duration(seconds: 15), builder: (context) {
        return Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.orange[500],
            ),
            child: ListTile(
              trailing: Icon(Icons.favorite_border_rounded),
              subtitle: Text(
                " krjrjrjjrjr",
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.black,
                ),
              ),
            ));
      }),
    );
  }
}
