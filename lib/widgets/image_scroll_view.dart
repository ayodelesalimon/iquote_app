import 'package:flut/util/image_list.dart';
import 'package:flutter/material.dart';

class ImageScrollView extends StatelessWidget {
  final String qoute;
  final String author;
  final ImageList imgList;
  final List<Color> colors;

  const ImageScrollView(
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
                SizedBox(height: 80),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    imgList.name,
                    height: screenHeight * 0.45,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("@iQuote-Minions",   style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontFamily: 'Josefin',
                    ),)
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Text(
                    qoute,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'Josefin',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    
                    children: [
                      Text(
                        author,
                        style: TextStyle(fontSize: 12,  fontFamily: 'Josefin', color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
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
