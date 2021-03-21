import 'package:admob_flutter/admob_flutter.dart';
import 'package:flut/helper/databasehelper.dart';
import 'package:flut/models/ads.dart';
import 'package:flut/models/quote_model.dart';

import 'package:flut/screens/quotes/quote_details.dart';
import 'package:flut/widgets/bottomads.dart';
import 'package:flut/widgets/show_dialog.dart';
import 'package:flutter/material.dart';

class FavoriteQuotes extends StatefulWidget {
  @override
  _FavoriteQuotesState createState() => _FavoriteQuotesState();
}

class _FavoriteQuotesState extends State<FavoriteQuotes> {
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;

  var idAds = AdsUnit();
  Future<List<Quote>> wholeQuotes;
  var dbHelper;

  void initState() {
    super.initState();
    dbHelper = DataBaseHelper();
    fetchDatafromTable();

    bannerSize = AdmobBannerSize.BANNER;

    interstitialAd = AdmobInterstitial(
      adUnitId: idAds.getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        //handleEvent(event, args, 'Interstitial');
      },
    );
    interstitialAd.load();
  }

  fetchDatafromTable() {
    setState(() {
      wholeQuotes = dbHelper.fetchSavedQuotes();
    });
  }

  @override
  void setState(fn) {
    super.setState(fn);
    bannerSize = AdmobBannerSize.BANNER;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: HomeAds(idAds: idAds, bannerSize: bannerSize),
        body: Material(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 10,

                  // snap: false,
                  //automaticallyImplyLeading: false,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    title: Text(
                      "FAVOURITE",
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.deepOrange,
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                    background: Container(
                      clipBehavior: Clip.antiAlias,
                      // child: Center(
                      //   child: Text(
                      //     "FAVOURITE",
                      //     style: TextStyle(color: Colors.black, fontSize: 35),
                      //   ),
                      // ),
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/cool.png"),
                        ),
                      ),
                    ),
                  ),
                )
              ];
            },
            body: SafeArea(
              child: FutureBuilder(
                  future: wholeQuotes,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (builder, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                            Duration(milliseconds: 100),
                                        pageBuilder: (context, _, __) =>
                                            QuoteDetails(
                                              quote: snapshot
                                                  .data[index].quoteText,
                                              author: snapshot
                                                  .data[index].quoteAuthor,
                                            )),
                                  );
                                },
                                child: Card(
                                  shadowColor: Colors.amberAccent,
                                  borderOnForeground: true,
                                  margin: EdgeInsets.all(10),
                                  elevation: 5,
                                  child: ListTile(
                                    title: Text(
                                      snapshot.data[index].quoteText,
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.0,
                                          fontFamily: 'Poppins'),
                                    ),
                                    subtitle: SizedBox(
                                      height: 20,
                                      child: Text(
                                        snapshot.data[index].quoteAuthor,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontFamily: 'quoteScript'),
                                      ),
                                    ),
                                    trailing: IconButton(
                                        icon: Icon(Icons.remove_circle),
                                        color: Colors.red,
                                        onPressed: () async {
                                          if (await interstitialAd.isLoaded) {
                                            interstitialAd.show();
                                          }
                                          return showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0),
                                                ),
                                              ),
                                              title: Text(
                                                "Do You Want To Remove Quote From Favourite?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    fontSize: 30,
                                                    fontFamily: "Poppins",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: Image.asset(
                                                'assets/6.png',
                                                width: 400,
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text(
                                                    "NO",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                        fontSize: 20,
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                    dbHelper
                                                        .deleteQuoteFromFavorite(
                                                            snapshot.data[index]
                                                                .quoteId);
                                                    fetchDatafromTable();
                                                    return showDialog(
                                                      context: context,
                                                      builder: (ctx) =>
                                                          ShowDialog(
                                                        text: "Quote Removed",
                                                        imgPath:
                                                            "assets/love.gif",
                                                        yesBtn: "DONE",
                                                        onPress: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    "YES",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                        fontSize: 20,
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                          // dbHelper.deleteQuoteFromFavorite(
                                          //     snapshot.data[index].quoteId);
                                          // fetchDatafromTable();
                                          // final removedSnackBar = newMethod();
                                          // Scaffold.of(context)
                                          //     .showSnackBar(removedSnackBar);
                                        }),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: Text(
                            'No Data in the Favorites',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Failed to Load Favorites'),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }

  SnackBar newMethod() {
    return SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.black,
      content: Text(
        'Quote Removed from Favorites',
        style: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 15.0),
      ),
    );
  }
}
