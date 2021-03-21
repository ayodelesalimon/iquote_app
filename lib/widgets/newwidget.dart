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

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnimContainer(
                    title: category.name,
                  )),
        );
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //       pageBuilder: (context, _, __) => AnimContainer(
        //             title: category.name,
        //           )),
        // );
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
              Align(
                alignment: Alignment(0, -1.5),
                child: Image.asset(
                  category.imgPath,
                  height: screenHeight * 0.7 * value,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 55, right: 30, bottom: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          category.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Tap to Read More",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 38),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Swipe ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.forward,
                              color: Colors.white,
                            ),
                          ],
                        )),
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
