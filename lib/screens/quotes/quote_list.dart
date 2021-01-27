import 'dart:async';
import 'dart:convert';
import 'package:flut/helper/databasehelper.dart';
import 'package:flut/models/quote_model.dart';
import 'package:flut/page_view_indicator.dart';
import 'package:flut/widgets/animate.dart';
import 'package:flut/widgets/flexible_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class AnimContainer extends StatefulWidget {
  final String title;

  const AnimContainer({Key key, this.title}) : super(key: key);
  @override
  _AnimContainerState createState() => _AnimContainerState();
}

class _AnimContainerState extends State<AnimContainer> {
  List data;
  var dbHelper;
  // ignore: unused_field
  var _index;
  Timer time;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  // ignore: missing_return
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() {
      data = json.decode(jsonText);
    });
  }

  // void _random() {
  //   setState(
  //     () {
  //       _index = Random(_index).nextInt(100);
  //     },
  //   );
  // }

  @override
  void initState() {
    this.loadJsonData();
    dbHelper = DataBaseHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              //title: Text(widget.title),
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
                      return Container(
                        child: ((data[index]['Category'] ==
                                '${widget.title}'.toLowerCase())
                            ? WidgetANimator(
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 350),
                                            pageBuilder: (context, _, __) =>
                                                HomePage(
                                                  author: data[index]['Author'],
                                                  quote: data[index]['Quote'],
                                                )),
                                      );
                                    },
                                    child: Card(
                                      shadowColor: Colors.amberAccent,
                                      borderOnForeground: true,
                                      margin: EdgeInsets.all(10),
                                      elevation: 5,
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Text(
                                                "  “ ${data[index]['Quote']} ”",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontFamily: 'Ubuntu',
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "  - ${data[index]['Author']} ",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                      fontFamily: 'Ubuntu',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.favorite_rounded,
                                                      color: Colors.red,
                                                    ),
                                                    onPressed: () {
                                                      Quote q = Quote(
                                                        quoteId: null,
                                                        quoteText: data[index]
                                                            ['Quote'],
                                                        quoteAuthor: data[index]
                                                            ['Author'],
                                                      );
                                                      dbHelper.saveQuote(q);
                                                      final removedSnackBar =
                                                          SnackBar(
                                                        duration: Duration(
                                                            seconds: 1),
                                                        backgroundColor:
                                                            Colors.black,
                                                        content: Text(
                                                          'Added to Favorites',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.0),
                                                        ),
                                                      );
                                                      Scaffold.of(context)
                                                          .showSnackBar(
                                                              removedSnackBar);
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.share,
                                                      color: Colors.red,
                                                    ),
                                                    onPressed: () {
                                                      Share.share(
                                                          data[index]['Quote']);
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
                                                        quoteText: data[index]
                                                            ['Quote'],
                                                        quoteAuthor: data[index]
                                                            ['Author'],
                                                      );
                                                      if (q != null) {
                                                        dbHelper.saveQuote(q);
                                                      }

                                                      final removedSnackBar =
                                                          SnackBar(
                                                        backgroundColor:
                                                            Colors.black,
                                                        content: Text(
                                                          'Added to Favorites',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.0),
                                                        ),
                                                      );
                                                      Scaffold.of(context)
                                                          .showSnackBar(
                                                              removedSnackBar);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              )
                            : Container()),
                      );
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
