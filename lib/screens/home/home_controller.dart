import 'package:flut/screens/about_page/morepage.dart';
import 'package:flut/screens/favourite/favourite.dart';
import 'package:flut/screens/home/homepage.dart';
import 'package:flut/util/category.dart';
import 'package:flut/widgets/navybar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Category category;

  const Home({Key key, this.category}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
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

  int _currentIndex = 0;
  List<Widget> _buildScreens() {
    return [HomePage(), FavoriteQuotes(), MorePage()];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        iconSize: 25,
        onItemSelected: (index) {
          onTabTapped(index);
        },
        backgroundColor: Colors.white,
        currentIndex: 0,
        items: [
          BottomNavyBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text("HOME"),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: Text(
                "FAVOURITE",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                ),
              ),
              activeColor: Colors.red,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: Icon(
                Icons.info_outline,
              ),
              title: Text("MORE"),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.grey)
        ],
      ),
      body: _buildScreens().elementAt(_currentIndex),
    );
  }
}
