import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imgPath;
  final List<Color> colors;

  Category({this.name, this.imgPath, this.colors});
}

List categorys = [
  Category(
      name: "LIFE",
      imgPath: "assets/2.png",
      colors: [Colors.orange.shade400, Colors.deepOrange.shade900]),
  Category(
      name: "LOVE",
      imgPath: "assets/cutee.png",
      colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)]),
  Category(
      name: "HUMOUR",
      imgPath: "assets/4.png",
      colors: [Colors.blueGrey.shade800, Colors.black87]),
  Category(
      name: "INSPIRATION",
      imgPath: "assets/2.png",
      colors: [Colors.green.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "life",
      imgPath: "assets/5.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
  Category(
      name: "hope",
      imgPath: "assets/shock.png",
      colors: [const Color(0xFFF58573), const Color(0xFFF4A25F)]),
  Category(
      name: "motivation",
      imgPath: "assets/3.png",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "success",
      imgPath: "assets/shock.png",
      colors: [const Color(0xFFF58573), const Color(0xFFF4A25F)]),
  Category(
      name: "friendship",
      imgPath: "assets/4.png",
      colors: [Colors.green.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "arts",
      imgPath: "assets/2.png",
      colors: [Colors.orange.shade400, Colors.deepOrange.shade900]),
  Category(
      name: "relationship,",
      imgPath: "assets/sidelook.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
  Category(
      name: "romance",
      imgPath: "assets/veryhappy.png",
      colors: [Colors.orange.shade400, Colors.deepOrange.shade900]),
  Category(
      name: "faith",
      imgPath: "assets/toocute.png",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "mind",
      imgPath: "assets/smi.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
];
