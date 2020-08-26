import 'package:automanager/resources/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/shadowClipper.dart';
import 'package:automanager/utilities/widgetForFab.dart';
import 'package:automanager/view/homeUI.dart';
import 'package:automanager/view/makeSaleUI.dart';
import 'package:flutter/material.dart';

class MakeSaleView extends StatefulWidget {
  @override
  _MakeSaleViewState createState() => _MakeSaleViewState();
}

class _MakeSaleViewState extends State<MakeSaleView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: MakeSaleUI(
                  context,
                  ClipPathWithShadow(MyClippers("MakeSaleView"),
                          MyColors().colorLightOrange, 8, 0, 0)
                      .getWidget(), MyColors().colorLightOrange, MyColors().colorLightdark)
              .getMakeSaleUI(),
          floatingActionButton:
              WidgetForFab(context, "MakeSaleView", MyColors().colorDeepOrange)
                  .getWidgetForFab(),
        ));
  }
}
