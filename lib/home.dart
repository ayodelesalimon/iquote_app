import 'package:flut/newwidget.dart';
import 'package:flut/screens/favourite.dart';
import 'package:flut/screens/homepage.dart';
import 'package:flut/screens/morepage.dart';
import 'package:flut/util/category.dart';
import 'package:flut/widgets/navybar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatefulWidget {
  final Category category;

  const Home({Key key, this.category}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // PersistentTabController _controller =
  //     PersistentTabController(initialIndex: 0);
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavyBar(
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
                  style: TextStyle(fontSize: 13),
                ),
                activeColor: Colors.red,
                inactiveColor: Colors.grey),
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
      ),
      body: _buildScreens().elementAt(_currentIndex),
    );
  }
}
