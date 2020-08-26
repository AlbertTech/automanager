import 'package:automanager/resources/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/view/salesReportUI.dart';
import 'package:flutter/material.dart';

class SalesReportView extends StatefulWidget {
  @override
  _SalesReportViewState createState() => _SalesReportViewState();
}

class _SalesReportViewState extends State<SalesReportView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: SalesReportUI(
                    context,
                    MyClippers("SalesReportView"),
                    MyColors().colorLightOrange,
                    MyColors().colorDeepOrange,
                    MyColors().colorLightBlue)
                .getSalesReportUI()));
  }
}
