import 'package:automanager/view/homeView.dart';
import 'package:flutter/material.dart';

class MyNavigatorUtil {

  navigateNewPage(BuildContext context, var placeToGo) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => placeToGo),
    );
  }

  popBack(BuildContext context) {
    Navigator.pop(context);
  }
}
