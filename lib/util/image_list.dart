import 'dart:core';

import 'package:flutter/material.dart';

class ImageList {
  final String name;
  final List<Color> colors;
  ImageList({this.colors, this.name});
}

List imageList = [
  ImageList(
    colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)],
    name: "assets/minions/1.png",
  ),
  ImageList(
    colors: [Colors.blueGrey.shade800, Colors.black87],
    name: "assets/minions/4.png",
  ),
  ImageList(
    colors: [const Color(0xFF90203F), const Color(0xFF537895)],
    name: "assets/happy.png",
  ),
   ImageList(
    colors: [Colors.green.shade200, Colors.deepOrange.shade400],
    name: "assets/shock.png",
  ),
 ImageList(
    colors: [Colors.blueGrey.shade800, Colors.black87],
    name: "assets/sidelook.png",
  ),
  ImageList(
    colors: [Colors.orange.shade400, Colors.deepOrange.shade900],
    name: "assets/minions/23.png",
  ),
   ImageList(
    colors: [Colors.blue.shade400, Colors.red.shade900],
    name: "assets/grind.png",
  ),


  ImageList(
    colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
    name: "assets/minions/6.png",
  ),
  ImageList(
    colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)],
    name: "assets/toocute.png",
  ),
  ImageList(
    colors: [Colors.orange.shade400, Colors.deepOrange.shade900],
    name: "assets/minions/9.png",
  ),
  ImageList(
    colors: [Colors.blueGrey.shade800, Colors.black87],
    name: "assets/minions/27.png",
  ),
  ImageList(
    colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)],
    name: "assets/minions/29.png",
  ),
   ImageList(
    colors: [Colors.orange.shade400, Colors.deepOrange.shade900],
    name: "assets/minions/13.png",
  ),
  ImageList(
    colors: [const Color(0xFF90203F), const Color(0xFF537895)],
    name: "assets/minions/17.png",
  ),
];
