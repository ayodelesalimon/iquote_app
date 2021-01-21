import 'package:flut/card.dart';
import 'package:flut/content.dart';
import 'package:flut/screens/humour_screen.dart';
import 'package:flut/util/category.dart';
import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  // final String img;
  // final String title;
  final Category category;

  const NewWidget(
      {Key key,
      this.pageController,
      this.currentPage,
      // this.img,
      // this.title,
      this.category})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double value = 1;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 350),
              pageBuilder: (context, _, __) => AnimContainer(
                    title: category.name,
                  )),
        );
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          if (pageController.position.haveDimensions) {
            value = pageController.page - currentPage;
            value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
            // if (currentPage == 0) {
            //   print("value $value");
            // }
          }
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipPath(
                  clipper: CardBackground(),
                  child: Hero(
                    tag: category.imgPath,
                    child: Container(
                      height: 0.75 * screenHeight,
                      width: 0.9 * screenWidth,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: category.colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -1.5),
                child: Image.asset(
                  category.imgPath,
                  height: screenHeight * 0.7 * value,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 20, bottom: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      tag: category.name,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            category.name.toUpperCase(),
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Tap to Read More",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CardBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();

    double curveDistance = 30;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);

    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.28) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
