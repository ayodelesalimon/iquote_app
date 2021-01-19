import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imgPath;
  final List<Color> colors;

  Category({this.name, this.imgPath, this.colors});
}

List categorys = [
  Category(
      name: "JOKES",
      imgPath: "assets/1.png",
      colors: [Colors.orange.shade400, Colors.deepOrange.shade900]),
  Category(
      name: "LOVE",
      imgPath: "assets/1.png",
      colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)]),
  Category(
      name: "HUMOUR",
      imgPath: "assets/smi.png",
      colors: [Colors.blueGrey.shade800, Colors.black87]),
  Category(
      name: "INSPIRATION",
      imgPath: "assets/2.png",
      colors: [Colors.green.shade200, Colors.deepOrange.shade400]),
  Category(
      name: "WORLD",
      imgPath: "assets/5.png",
      colors: [const Color(0xFF90203F), const Color(0xFF537895)]),
  Category(
      name: "JOKES",
      imgPath: "assets/shock.png",
      colors: [const Color(0xFFF58573), const Color(0xFF5F79F4)]),
  Category(
      name: "JS",
      imgPath: "assets/1.png",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
];
