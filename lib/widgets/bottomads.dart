import 'package:admob_flutter/admob_flutter.dart';
import 'package:flut/models/ads.dart';
import 'package:flutter/material.dart';

class HomeAds extends StatelessWidget {
  const HomeAds({
    Key key,
    @required this.idAds,
    @required this.bannerSize,
  }) : super(key: key);

  final AdsUnit idAds;
  final AdmobBannerSize bannerSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: AdmobBanner(
          adUnitId: idAds.getBannerAdUnitId(),
          adSize: bannerSize,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            print("$event");
          },
        ),
      ),
    );
  }
}

class InfoAds extends StatelessWidget {
  const InfoAds({
    Key key,
    @required this.idAds,
    @required this.bannerSize,
  }) : super(key: key);

  final AdsUnit idAds;
  final AdmobBannerSize bannerSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: AdmobBanner(
          adUnitId: idAds.getBannerAdUnitIdForInfo(),
          adSize: bannerSize,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            print("$event");
          },
        ),
      ),
    );
  }
}

class QuoteListAds extends StatelessWidget {
  const QuoteListAds({
    Key key,
    @required this.idAds,
    @required this.bannerSize,
  }) : super(key: key);

  final AdsUnit idAds;
  final AdmobBannerSize bannerSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: AdmobBanner(
          adUnitId: idAds.getBannerAdUnitIdForInfoForQuoteList(),
          adSize: bannerSize,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            print("$event");
          },
        ),
      ),
    );
  }
}