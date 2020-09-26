import 'file:///D:/Programming/Flutter_Projects/automanager/lib/utilities/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/view/rolesUI.dart';
import 'package:flutter/material.dart';

class RolesView extends StatefulWidget {
  @override
  _RolesViewState createState() => _RolesViewState();
}

class _RolesViewState extends State<RolesView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: RolesUI(
                    context,
                    MyColors().colorLightBlue,
                    MyColors().colorLightOrange,
                    MyClippers("RolesView_1"),
                    MyClippers("RolesView_2"))
                .getRolesUI()));
  }
}
