import 'dart:convert';

import 'package:flut/helper/databasehelper.dart';
import 'package:flut/models/quote_model.dart';
import 'package:flut/quoteview.dart';
import 'package:flut/screens/favourite.dart';
import 'package:flut/widgets/animate.dart';
import 'package:flut/widgets/flexible_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class AnimContainer extends StatefulWidget {
  @override
  _AnimContainerState createState() => _AnimContainerState();
}

class _AnimContainerState extends State<AnimContainer> {
  List data;
  var dbHelper;
  // ignore: missing_return
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() => data = json.decode(jsonText));
    data.where((e) => e['category'] == 'humour').toList();
  }

  @override
  void initState() {
    this.loadJsonData();
    dbHelper = DataBaseHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: MyFlexiableAppBar(),
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
                      return WidgetANimator(Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 350),
                                  pageBuilder: (context, _, __) => PageViewDemo(
                                        quote: data[index]['Quote'],
                                      )),
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.all(10),
                            elevation: 1,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      data[index]['Quote'],
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            Quote q = Quote(
                                              quoteId: null,
                                              quoteText: data[index]['Quote'],
                                              quoteAuthor: data[index]
                                                  ['Author'],
                                            );
                                            dbHelper.saveQuote(q);
                                            final removedSnackBar = SnackBar(
                                              backgroundColor: Colors.black,
                                              content: Text(
                                                'Added to Favorites',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0),
                                              ),
                                            );
                                            Scaffold.of(context)
                                                .showSnackBar(removedSnackBar);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.share,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            Share.share(data[index]['Quote']);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            Quote q = Quote(
                                              quoteId: null,
                                              quoteText: data[index]['Quote'],
                                              quoteAuthor: data[index]
                                                  ['Author'],
                                            );
                                            dbHelper.saveQuote(q);
                                            final removedSnackBar = SnackBar(
                                              backgroundColor: Colors.black,
                                              content: Text(
                                                'Added to Favorites',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0),
                                              ),
                                            );
                                            Scaffold.of(context)
                                                .showSnackBar(removedSnackBar);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ));
                      // return Padding(
                      //     padding: const EdgeInsets.all(18.0),
                      
                      //     child: Container(
                      //         height: 250,
                      //         decoration: BoxDecoration(
                      //           color: Colors.yellowAccent,
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(18.0),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               Navigator.push(
                      //                 context,
                      //                 PageRouteBuilder(
                      //                     transitionDuration:
                      //                         Duration(milliseconds: 350),
                      //                     pageBuilder: (context, _, __) =>
                      //                         PageViewDemo(
                      //                           quote: data[index]['Quote'],
                      //                         )),
                      //               );
                      //             },
                      //             child: ListTile(
                      //               subtitle: Text(
                      //                 data[index]['Author'],
                      //                 style: TextStyle(
                      //                   fontSize: 18.0,
                      //                   color: Colors.black,
                      //                 ),
                      //               ),
                      //               trailing:
                      //                   Icon(Icons.favorite_border_rounded),
                      //               title: Text(
                      //                 data[index]['Quote'],
                      //                 style: TextStyle(
                      //                   fontSize: 23.0,
                      //                   color: Colors.black,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         )));
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
