import 'package:flutter/material.dart';

class MyClippers extends CustomClipper<Path> {
  MyClippers(this.viewState);

  final String viewState;

  @override
  Path getClip(Size size) {
    Path path = new Path();

    switch (viewState) {
      case "LoginView":
        path.lineTo(0, size.height * .23);
        path.quadraticBezierTo(
            size.width * .2, size.height * .1, size.width * .7, 0);
        break;

      case "RegisterView_1":
        path.lineTo(size.width*.5, 0);
        path.quadraticBezierTo(size.width*.485, size.height*.05, size.width*.25, size.height*.1);
        path.quadraticBezierTo(size.width*.2, size.height*.17, 0, size.height*.18);
        break;

      case "RegisterView_2":
        path.lineTo(size.width*.5, size.height);
        path.quadraticBezierTo(
            size.width * .5, size.height * .95, size.width*.75, size.height*.925);
        path.quadraticBezierTo(
            size.width *.8, size.height * .85, size.width, size.height*.84);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width*.5, size.height);
        break;

      default:
        break;
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
