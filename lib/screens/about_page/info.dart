import 'package:admob_flutter/admob_flutter.dart';
import 'package:flut/models/ads.dart';
import 'package:flut/screens/about_page/app_info.dart';
import 'package:flut/widgets/bottomads.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
   AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;
  
  var idAds = AdsUnit();

  String _privacyPolicyUrl =
      "https://sites.google.com/view/minions-quote-privacypolicy/home";
  String _termsConditins =
      "https://sites.google.com/view/iquote-minion-termsconditions";
  String _buyMeCoffee = "https://www.buymeacoffee.com/ayodelesalimon";

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
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    bannerSize = AdmobBannerSize.BANNER;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: InfoAds(idAds: idAds, bannerSize: bannerSize),
      body: Material(
        child:
           
            ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/tri.png"),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "INFO PAGE",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                Container(
                

                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardWidget(
                          title: "About App",
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 100),
                                  pageBuilder: (context, _, __) => AppInfo()),
                            );

                           
                           
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CardWidget(
                          title: "Buy Us A Coffee",
                          icon: Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                          ),
                          onTap: () {
                            _openBuyMeCoffee(context);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CardWidget(
                          title: "Privacy Policy",
                          icon: Icon(
                            Icons.privacy_tip,
                            color: Colors.white,
                          ),
                          onTap: () {
                            _openPrivacyPolicy(context);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CardWidget(
                          title: "Terms & Conditions",
                          icon: Icon(
                            Icons.privacy_tip,
                            color: Colors.white,
                          ),
                          onTap: () {
                            _openTermsCondtions(context);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // CardWidget(
                        //   title: "Rate Us",
                        //   icon: Icon(
                        //     Icons.star_border,
                        //     color: Colors.white,
                        //   ),
                        //   onTap: () {
                        //     return showDialog(
                        //       context: context,
                        //       builder: (ctx) => AlertDialog(
                        //         title: Text("Alert Dialog Box"),
                        //         content:
                        //             Text("You have raised a Alert Dialog Box"),
                        //         actions: <Widget>[
                        //           FlatButton(
                        //             onPressed: () {
                        //               Navigator.of(ctx).pop();
                        //             },
                        //             child: Text("okay"),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void _openOpenSourceLicenses(BuildContext context) {
  //   showLicensePage(
  //     context: context,
  //     applicationName: "iMinions Quote",
  //     applicationVersion: '1.0.1',
  //   );
  // }

  void _openPrivacyPolicy(BuildContext context) async {
    if (await canLaunch(_privacyPolicyUrl)) {
      await launch(_privacyPolicyUrl);
    } else {
      // _showOpeningBrowserFailedToast(context);
    }
  }

  void _openTermsCondtions(BuildContext context) async {
    if (await canLaunch(_termsConditins)) {
      await launch(_termsConditins);
    } else {
      // _showOpeningBrowserFailedToast(context);
    }
  }

  void _openBuyMeCoffee(BuildContext context) async {
    if (await canLaunch(_buyMeCoffee)) {
      await launch(_buyMeCoffee);
    } else {
      // _showOpeningBrowserFailedToast(context);
    }
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function onTap;
  const CardWidget({
    Key key,
    this.title,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent,
                child: icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        width: screenWidth,
        height: 70,
        decoration: BoxDecoration(
          // color: Colors.grey[200],
          border: Border.all(color: Colors.orangeAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
