import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flut/models/ads.dart';
import 'package:flut/util/image_list.dart';
import 'package:flut/widgets/image_scroll_view.dart';
import 'package:flut/widgets/show_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:permission_handler/permission_handler.dart';

class QuoteDetails extends StatefulWidget {
  final String quote;
  final String author;

  const QuoteDetails({
    Key key,
    this.quote,
    this.author,
  }) : super(key: key);
  @override
  _QuoteDetailsState createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  // ignore: unused_field
  File _imageFile;
  AdmobInterstitial interstitialAd;

  var idAds = AdsUnit();
  GlobalKey _globalKey = GlobalKey();

  Random rng;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  final controller = PageController(viewportFraction: 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestPermission();
    interstitialAd = AdmobInterstitial(
      adUnitId: idAds.getInterstitialAdUnitIdForInfoForImageQuote(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        //handleEvent(event, args, 'Interstitial');
      },
    );
    interstitialAd.load();
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.download_rounded),
        onPressed: () {
          _saveScreen();
          return showDialog(
            context: context,
            builder: (ctx) => ShowDialog(
              text: "Image Downloaded",
              imgPath: "assets/love.gif",
              yesBtn: "DONE",
              onPress: () async {
                Navigator.of(context).pop();
                if (await interstitialAd.isLoaded) {
                  interstitialAd.show();
                }
              },
            ),
          );
        },
      ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(height: 16),

                  RepaintBoundary(
                    key: _globalKey,
                    child: Container(
                        height: screenHeight,
                        child: PageView(
                          controller: controller,
                          children: [
                            for (var i = 0; i < imageList.length; i++)
                              Container(
                                child: ImageScrollView(
                                  qoute: widget.quote,
                                  author: widget.author,
                                  imgList: imageList[i],
                                  colors: [],
                                  //author: widget.author,
                                ),
                              ),
                          ],
                        )),
                  ),

                  // SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SmoothPageIndicator(
                controller: controller,
                count: imageList.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.orange,
                  expansionFactor: 3,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();

    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final result = await ImageGallerySaver.saveImage(
      byteData.buffer.asUint8List(),
      quality: 80,
    );
    print(result);
  }
}
