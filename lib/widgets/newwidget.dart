
import 'package:flut/screens/quotes/quote_list.dart';
import 'package:flut/util/category.dart';
import 'package:flut/widgets/card_shape.dart';
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

