import 'package:flutter/material.dart';

class baseWidget {

  Widget getBaseWidget(Widget widget) {
    return MaterialApp(
      home: Scaffold(body: Builder(builder: (BuildContext context) {
        var size = MediaQuery
            .of(context)
            .size;
        return Container(
          width: size.width, height: size.height, color: Colors.red,
          child:widget,
        );
      })),
    );
  }
}
