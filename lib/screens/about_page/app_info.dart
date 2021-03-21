import 'package:admob_flutter/admob_flutter.dart';
import 'package:flut/models/ads.dart';
import 'package:flut/widgets/bottomads.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;

  var idAds = AdsUnit();
  void initState() {
    bannerSize = AdmobBannerSize.BANNER;
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    bannerSize = AdmobBannerSize.BANNER;
  }

  @override
  Widget build(BuildContext context) {
    String info =
        "iQuote Minions is an app with over 20000+ Quotes.";

    return Scaffold(
      bottomSheet: InfoAds(idAds: idAds, bannerSize: bannerSize),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'i',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 30,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Quote',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'M',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 30,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'inions',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ],
                  ),
                  // Text(
                  //   "iQuote Minions ",
                  //   style: TextStyle(
                  //       fontSize: 30,
                  //       fontFamily: "Poppins",
                  //       fontStyle: FontStyle.normal,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "version 1.0.0",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 200,
                      width: 250,
                      child: Image.asset(
                        "assets/1.png",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          info,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Made With",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Text(
                      " Flutter ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
