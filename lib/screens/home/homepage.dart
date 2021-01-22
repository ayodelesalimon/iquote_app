import 'package:flut/util/category.dart';
import 'package:flut/widgets/newwidget.dart';
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
                    Text("Quote",
                        style: TextStyle(
                          fontSize: 46.0,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        )),
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
                        currentPage: i,
                        pageController: _pageController,
                      ),
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
