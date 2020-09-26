
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/widgetForFab.dart';
import 'package:automanager/view/makeSaleReceiptUI.dart';
import 'package:flutter/material.dart';

class MakeSaleReceiptView extends StatefulWidget {
  @override
  _MakeSaleReceiptViewState createState() => _MakeSaleReceiptViewState();
}

class _MakeSaleReceiptViewState extends State<MakeSaleReceiptView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: MakeSaleReceiptUI(context, MyColors().colorLightOrange,
                  MyColors().colorLightdark)
              .getMakeSaleReceiptUI(),
          floatingActionButton: WidgetForFab(
                  context, "MakeSaleReceiptView", MyColors().colorDeepOrange)
              .getWidgetForFab(),
        ));
  }
}
