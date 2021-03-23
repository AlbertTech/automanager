import 'package:automanager/resources/myColors.dart';
import 'package:automanager/view/InventoryUI.dart';
import 'package:flutter/material.dart';

class InventoryView extends StatefulWidget {
  @override
  _InventoryViewState createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body:
            InventoryUI(
                context,
                MyColors().colorLightOrange,
                MyColors().colorLightBlue)
                .getInventoryUI()));
  }
}
