import 'package:automanager/resources/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/shadowClipper.dart';
import 'package:automanager/utilities/widgetForFab.dart';
import 'package:automanager/view/AddStockUI.dart';
import 'package:flutter/material.dart';

class AddStockView extends StatefulWidget {
  @override
  _AddStockViewState createState() => _AddStockViewState();
}

class _AddStockViewState extends State<AddStockView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: (ThemeData(brightness: Brightness.light)),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: AddStockUI(
                context,
                ClipPathWithShadow(
                        MyClippers("AddStockView"), MyColors().colorLightOrange,8,0,-3)
                    .getWidget(),
                MyColors().colorDeepOrange,
                MyColors().colorLightdark)
            .getAddStockUI(),
        floatingActionButton:
            WidgetForFab(context, "AddStockView", MyColors().colorDeepOrange)
                .getWidgetForFab(),
      ),
    );
  }
}
