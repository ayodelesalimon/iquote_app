import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  DateTime alert;
  var index;
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
    // _index = Random(_index).nextInt(3000);
    super.setState(fn);
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: data == null
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.orange[400],
              ))
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: ((data[index]['Category'] == "inspiration")
                        ? Card(
                            margin: EdgeInsets.all(10),
                            elevation: 1,
                            child: Text(
                              "  “ ${data[index]['Quote']} ”",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        : Container()),
                  );
                },
              ),
      ),
    );
  }
}
