import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flut/util/image_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  final String quote;
  final String author;

  const HomePage({
    Key key,
    this.quote,
    this.author,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _imageFile;
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
        },
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: 16),
              RepaintBoundary(
                key: _globalKey,
                child: SizedBox(
                    height: 620,
                    child: PageView(
                      controller: controller,
                      children: [
                        for (var i = 0; i < imageList.length; i++)
                          MyPage4Widget(
                            qoute: widget.quote,
                            imgList: imageList[i],
                            colors: [],
                            author: widget.author,
                          ),
                      ],
                    )),
              ),
              SizedBox(height: 16),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: imageList.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                    expansionFactor: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
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
    //final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // Uint8List pngBytes = byteData.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(
      byteData.buffer.asUint8List(),
      quality: 80,
    );
    print(result);

    // File imgFile = File('$directory/screenshot.png');
    // setState(() {
    //   _imageFile = imgFile;
    // });
    // _saveFile(_imageFile);
    // imgFile.writeAsBytes(pngBytes);
    // final result =
    //     await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    // print(result);
  }

  // _saveFile(File file) async {
  //   await _requestPermission();
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(await file.readAsBytes()),
  //       quality: 60,
  //       name: "Minion");
  //   print(result);
  // }
}

class NeWidget extends StatelessWidget {
  final ImageList imgList;
  final String text;
  const NeWidget({
    Key key,
    this.imgList,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: 'Josefin',
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: imgList.colors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: AssetImage(imgList.name),
          // ),
        ),
        height: 380,
      ),
    );
  }
}

class MyPage4Widget extends StatelessWidget {
  final String qoute;
  final String author;
  final ImageList imgList;
  final List<Color> colors;

  const MyPage4Widget(
      {Key key, this.qoute, this.imgList, this.colors, this.author})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: imgList.colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    imgList.name,
                    height: screenHeight * 0.45,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Text(
                    qoute,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Josefin',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        author,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
