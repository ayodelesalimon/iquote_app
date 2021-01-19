import 'package:flut/newwidget.dart';
import 'package:flut/util/category.dart';
import 'package:flut/widgets/navybar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Category category;

  const Home({Key key, this.category}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      bottomNavigationBar: BottomNavyBar(
        iconSize: 30,
        onItemSelected: (int) {
          print("home");
        },
        backgroundColor: Colors.white,
        currentIndex: 0,
        items: [
          BottomNavyBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text("HOME"),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              title: Text(
                "FAVOURITE",
                style: TextStyle(fontSize: 13),
              ),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(
                Icons.menu,
                color: Colors.grey,
              ),
              title: Text("MORE"),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.black)
        ],
      ),

      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //   height: 60,
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Icon(
      //             Icons.home,
      //             color: isActive ? Colors.orange : Colors.pink,
      //             size: 30,
      //           ),
      //           Text(
      //             "Home",
      //             style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Icon(Icons.favorite,
      //               color: isActive ? Colors.orange : Colors.pink),
      //           Text("Favourite"),
      //         ],
      //       ),
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Icon(Icons.menu, color: isActive ? Colors.yellow : Colors.pink),
      //           Text("More"),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
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
