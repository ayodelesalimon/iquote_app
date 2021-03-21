import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imgPath;
  final List<Color> colors;

  Category({this.name, this.imgPath, this.colors});
}

List categorys = [
  Category(
      name: "LOVE",
      imgPath: "assets/minions/4.png",
      colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)]),
  Category(
      name: "humor",
      imgPath: "assets/minions/9.png",
      colors: [Colors.blueGrey.shade800, Colors.black87]),
  Category(
      name: "INSPIRATION",
      imgPath: "assets/minions/19.png",
      colors: [Colors.green.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "life",
      imgPath: "assets/minions/5.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
       Category(
      name: "relationship",
      imgPath: "assets/minions/25.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
  Category(
      name: "books",
      imgPath: "assets/minions/26.png",
      colors: [Colors.orange.shade400, Colors.deepOrange.shade900]),
  Category(
      name: "hope",
      imgPath: "assets/minions/28.png",
      colors: [const Color(0xFFF58573), const Color(0xFFF4A25F)]),
  Category(
      name: "motivation",
      imgPath: "assets/minions/2.png",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "success",
      imgPath: "assets/minions/22.png",
      colors: [const Color(0xFFF58573), const Color(0xFFF4A25F)]),
  Category(
      name: "friendship",
      imgPath: "assets/minions/6.png",
      colors: [Colors.green.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "arts",
      imgPath: "assets/minions/2.png",
      colors: [Colors.orange.shade400, Colors.deepOrange.shade900]),
  Category(
      name: "philosophy",
      imgPath: "assets/minions/29.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
       Category(
      name: "wisdom",
      imgPath: "assets/minions/9.png",
      colors: [Colors.blueGrey.shade800, Colors.black87]),

  Category(
      name: "romance",
      imgPath: "assets/minions/24.png",
      colors: [Colors.orange.shade400, Colors.deepOrange.shade900]),
  Category(
      name: "faith",
      imgPath: "assets/minions/31.png",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "mind",
      imgPath: "assets/minions/29.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
];
