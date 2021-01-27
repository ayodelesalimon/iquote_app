import 'dart:core';

import 'package:flutter/material.dart';

class ImageList {
  final String name;
  final List<Color> colors;
  ImageList({this.colors, this.name});
}

List imageList = [
  // ImageList(name: "assets/bat.jpg"),
  // ImageList(name: "assets/rock.png"),
  // ImageList(name: "assets/wak.jpg"),
  // ImageList(name: "assets/black.png"),
  ImageList(
    colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)],
    name: "assets/1.png",
  ),
  ImageList(
    colors: [Colors.blueGrey.shade800, Colors.black87],
    name: "assets/4.png",
  ),
  ImageList(
    colors: [const Color(0xFF90203F), const Color(0xFF537895)],
    name: "assets/happy.png",
  ),
  ImageList(
    colors: [Colors.orange.shade400, Colors.deepOrange.shade900],
    name: "assets/3.png",
  ),

  ImageList(
    colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
    name: "assets/6.png",
  ),
  ImageList(
    colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)],
    name: "assets/toocute.png",
  )
];
