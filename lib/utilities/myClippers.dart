import 'package:flutter/material.dart';

class MyClippers extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      Path path = new Path();
      path.lineTo(0, size.height*.23);
      path.quadraticBezierTo(size.width*.2, size.height*.1, size.width*.7, 0);
      return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }


}