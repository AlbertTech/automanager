import 'package:automanager/view/homeView.dart';
import 'package:flutter/material.dart';

class MyNavigatorUtil {

  navigateNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeView()),
    );
  }

  popBack(BuildContext context) {
    Navigator.pop(context);
  }
}
