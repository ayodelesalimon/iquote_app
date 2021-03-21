import 'dart:async';
import 'dart:convert';

import 'package:admob_flutter/admob_flutter.dart';

import 'package:flut/helper/databasehelper.dart';
import 'package:flut/models/ads.dart';

import 'package:flut/models/quote_model.dart';

import 'package:flut/screens/home/home_controller.dart';
import 'package:flut/screens/quotes/quote_details.dart';
import 'package:flut/widgets/animate.dart';
import 'package:flut/widgets/bottomads.dart';
import 'package:flut/widgets/flexible_appbar.dart';

import 'package:flut/widgets/show_dialog.dart';
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

  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;

  var idAds = AdsUnit();
  // Timer time;
  // var _index = Random().nextInt(3000);
  // int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

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
    bannerSize = AdmobBannerSize.BANNER;

    interstitialAd = AdmobInterstitial(
      adUnitId: idAds.getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        //handleEvent(event, args, 'Interstitial');
      },
    );
    interstitialAd.load();
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    bannerSize = AdmobBannerSize.BANNER;
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: QuoteListAds(idAds: idAds, bannerSize: bannerSize),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  centerTitle: true,
                  title: Text(
                    widget.title.toUpperCase(),
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.deepOrange[600],
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                    color: Colors.white,
                    iconSize: 20,
                    icon: Icon(Icons.arrow_back_ios,
                        color: Colors.deepOrange[600]),
                    onPressed: () async {
                      if (await interstitialAd.isLoaded) {
                        interstitialAd.show();
                      }
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => Home()),
                      );
                    },
                  ),
                  backgroundColor: Colors.blueAccent[300],
                  shadowColor: Colors.grey,
                  elevation: 50,
                  automaticallyImplyLeading: false,
                  //  title: Text(widget.title),
                  expandedHeight: 300.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
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
                            child:
                                ((data[index]['Category'] ==
                                        '${widget.title}'.toLowerCase())
                                    ? WidgetANimator(
                                        Container(
                                          child: GestureDetector(
                                            onTap: () async {
                                              if (await interstitialAd
                                                  .isLoaded) {
                                                interstitialAd.show();
                                              }
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        QuoteDetails(
                                                          author: data[index]
                                                              ['Author'],
                                                          quote: data[index]
                                                              ['Quote'],
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
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            "  - ${data[index]['Author']} ",
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Ubuntu',
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
                                                              Icons
                                                                  .favorite_outline_outlined,
                                                              color: Colors.red,
                                                            ),
                                                            onPressed: () {
                                                              return showDialog(
                                                                context:
                                                                    context,
                                                                builder: (ctx) =>
                                                                    AlertDialog(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          18.0),
                                                                    ),
                                                                  ),
                                                                  title: Text(
                                                                    "Do You Want To Add Quote To Favourite?",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .deepOrangeAccent,
                                                                        fontSize:
                                                                            30,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  content: Image
                                                                      .asset(
                                                                    'assets/sidelook.png',
                                                                    width: 400,
                                                                  ),
                                                                  actions: <
                                                                      Widget>[
                                                                    FlatButton(
                                                                      onPressed:
                                                                          () async {
                                                                        Navigator.of(ctx)
                                                                            .pop();
                                                                        if (await interstitialAd
                                                                            .isLoaded) {
                                                                          interstitialAd
                                                                              .show();
                                                                        }
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "NO",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .deepOrangeAccent,
                                                                            fontSize:
                                                                                20,
                                                                            fontFamily:
                                                                                "Poppins",
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    FlatButton(
                                                                      child:
                                                                          Text(
                                                                        "YES",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .deepOrangeAccent,
                                                                            fontSize:
                                                                                20,
                                                                            fontFamily:
                                                                                "Poppins",
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(ctx)
                                                                            .pop();
                                                                        Quote
                                                                            q =
                                                                            Quote(
                                                                          quoteId:
                                                                              null,
                                                                          quoteText:
                                                                              data[index]['Quote'],
                                                                          quoteAuthor:
                                                                              data[index]['Author'],
                                                                        );
                                                                        dbHelper
                                                                            .saveQuote(q);
                                                                        return showDialog(
                                                                          context:
                                                                              context,
                                                                          builder: (ctx) =>
                                                                              ShowDialog(
                                                                            text:
                                                                                "Quote Added To Favourite",
                                                                            imgPath:
                                                                                "assets/love.gif",
                                                                            yesBtn:
                                                                                "DONE",
                                                                            onPress:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.share,
                                                              color: Colors
                                                                  .blueAccent,
                                                            ),
                                                            onPressed: () {
                                                              Share.share(data[
                                                                      index]
                                                                  ['Quote']);
                                                            },
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.perm_media,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                PageRouteBuilder(
                                                                    pageBuilder: (context,
                                                                            _,
                                                                            __) =>
                                                                        QuoteDetails(
                                                                          author:
                                                                              data[index]['Author'],
                                                                          quote:
                                                                              data[index]['Quote'],
                                                                        )),
                                                              );
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
                        },
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
