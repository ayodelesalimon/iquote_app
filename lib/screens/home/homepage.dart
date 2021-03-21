import 'package:flut/util/category.dart';
import 'package:flut/widgets/bottomads.dart';
import 'package:flut/widgets/newwidget.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flut/models/ads.dart';

class HomePage extends StatefulWidget {
  final Category category;

  const HomePage({Key key, this.category}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int currentPage = 0;
  bool isActive = true;
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;
  //AdmobReward rewardAd;
  var idAds = AdsUnit();

  @override
  void setState(fn) {
    super.setState(fn);
    bannerSize = AdmobBannerSize.BANNER;
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    //rewardAd.dispose();
    //subscription.cancel();

    super.dispose();
  }

  @override
  void initState() {
    bannerSize = AdmobBannerSize.BANNER;

    interstitialAd = AdmobInterstitial(
      adUnitId: idAds.getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        //handleEvent(event, args, 'Interstitial');
      },
    );
    interstitialAd.load();
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: HomeAds(idAds: idAds, bannerSize: bannerSize),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'i',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 40,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Quote',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
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
                              fontSize: 40,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'inions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                    ),
                  ],
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text("Quote",
                //         style: TextStyle(
                //           color: Colors.deepOrange[600],
                //           fontSize: 50.0,
                //           fontFamily: 'Poppins',
                //           fontStyle: FontStyle.normal,
                //           fontWeight: FontWeight.w600,
                //         )),
                //   ],
                // ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    for (var i = 0; i < categorys.length; i++)
                      NewWidget(
                        category: categorys[i],
                        currentPage: i,
                        pageController: _pageController,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


