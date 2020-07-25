import 'package:flutter/material.dart';

class myWidgetCreator {
  var sizeOfScreen;

  Widget getBaseWidget(Widget widget) {
    return MaterialApp(
        home: Scaffold(
          body: Container(
              color: Colors.white,
              child: widget),
        ));
  }

  Widget setLayoutWidget() {
    return Builder(builder: (BuildContext context) {
      return Container(width: MediaQuery
          .of(context)
          .size
          .width * .5, color: Colors.red,);
    });
  }
}
