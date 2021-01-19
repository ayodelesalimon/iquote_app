import 'dart:convert';

import 'package:flut/quoteview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardContainer extends StatefulWidget {
  @override
  _CardContainerState createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  List data;

  // ignore: missing_return
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() => data = json.decode(jsonText));
    data.where((e) => e['category'] == 'humour').toList();
  }

  @override
  void initState() {
    this.loadJsonData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                Column(
                  children: [
                    // Image.asset("assets/1.png"),
                    // Text(
                    //   "Quote",
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ],
                )
              ],
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Love"),
                background: Image.asset(
                  "assets/bat.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: Container(
          child: data == null
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.orange[400],
                ))
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) =>
                                              PageViewDemo(
                                                quote: data[index]['Quote'],
                                              )),
                                    );
                                  },
                                  child: ListTile(
                                    subtitle: Text(
                                      data[index]['Author'],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing:
                                        Icon(Icons.favorite_border_rounded),
                                    title: Text(
                                      data[index]['Quote'],
                                      style: TextStyle(
                                        fontSize: 23.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )));
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
