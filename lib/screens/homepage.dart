import 'package:flut/newwidget.dart';
import 'package:flut/util/category.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quote",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    for (var i = 0; i < categorys.length; i++)
                      NewWidget(
                        category: categorys[i],
                        // img: categorys[i].imgPath,
                        // title: categorys[i].name,
                        currentPage: i,
                        pageController: _pageController,
                      ),

                    // NewWidget(
                    //   img: "assets/cutee.png",
                    //   title: "LOVES",
                    //   currentPage: 1,
                    //   pageController: _pageController,
                    // ),
                    // NewWidget(
                    //   img: "assets/1.png",
                    //   title: "HUMOUR",
                    //   currentPage: 2,
                    //   pageController: _pageController,
                    // ),
                    // NewWidget(
                    //   img: "assets/6.png",
                    //   title: "INSPIRATION",
                    //   currentPage: 3,
                    //   pageController: _pageController,
                    // ),
                    // TwoWidget(
                    //   currentPage: 4,
                    //   title: "FUNNY",
                    //   pageController: _pageController,
                    //   img: "assets/3.png",
                    // ),
                    // TwoWidget(
                    //   currentPage: 5,
                    //   title: "FUNNY",
                    //   pageController: _pageController,
                    //   img: "assets/4.png",
                    // ),
                    // TwoWidget(
                    //   currentPage: 6,
                    //   title: "FUNNY",
                    //   pageController: _pageController,
                    //   img: "assets/2.png",
                    // )
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
