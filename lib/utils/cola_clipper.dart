import 'dart:ui';

import 'package:flutter/material.dart';

class ColaClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double radius = 17;

    path.moveTo(0, 35);
    path.lineTo(35, size.height);
    path.quadraticBezierTo(size.width / 2, size.height - radius, size.width - 35, size.height);
    path.lineTo(size.width, 35);
    path.quadraticBezierTo(size.width / 2, 0, 0, 35);
    path.lineTo(0, 0);
    

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
