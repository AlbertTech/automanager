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
        path.lineTo(size.width * .5, 0);
        path.quadraticBezierTo(size.width * .485, size.height * .05,
            size.width * .25, size.height * .1);
        path.quadraticBezierTo(
            size.width * .2, size.height * .17, 0, size.height * .18);
        break;

      case "RegisterView_2":
        path.lineTo(size.width * .5, size.height);
        path.quadraticBezierTo(size.width * .5, size.height * .95,
            size.width * .75, size.height * .925);
        path.quadraticBezierTo(
            size.width * .8, size.height * .85, size.width, size.height * .84);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width * .5, size.height);
        break;

      case "HomeView_1":
        path.lineTo(size.width * .35, 0);
        path.quadraticBezierTo(
            size.width * .35, (size.height * .35) * .55, 0, size.height * .35);
        break;

      case "HomeView_2":
        path.lineTo(0, size.height * .05);
        path.quadraticBezierTo(
            size.width * .25, (size.height * .6) * .5, 0, size.height * .6);
        break;

      case "AddStockView":
        path.lineTo(0, size.height * .2);
        path.quadraticBezierTo(size.width * .1, size.height * .35,
            size.width * .45, size.height * .35);
        path.quadraticBezierTo(
            size.width, size.height * .35, size.width, size.height * .4);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        path.close();
        break;

      case "MakeSaleView":
        path.lineTo(0, size.height*.7);
        path.quadraticBezierTo(size.width*.5, size.height*.625, size.width, size.height*.7);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        path.close();
        break;


      case "SalesReportView":
        path.lineTo(size.width * .5, 0);
        path.lineTo(0, size.height * .17);
        break;

      case "RolesView_1":
        path.lineTo(0, size.height * .7);
        path.quadraticBezierTo(
            size.width * .55, size.height * .7, size.width * .55, size.height);
        path.lineTo(0, size.height);
        path.lineTo(0, size.height * .7);
        break;

      case "RolesView_2":
        path.lineTo(size.width * .7, 0);
        path.quadraticBezierTo(
            size.width * .75, size.height * .15, size.width, size.height * .2);
        path.lineTo(size.width, 0);
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
