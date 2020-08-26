import 'package:automanager/resources/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/view/homeUI.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: HomeUI(
                context,
                [
              'assets/images/image_add_stock.png',
              'assets/images/image_make_sale.png',
              'assets/images/image_update_stock.png',
              'assets/images/image_view_sales.png',
              'assets/images/image_view_storage.png',
              'assets/images/image_view_roles.png',
            ], MyColors().colorLightBlue, MyColors().colorLightOrange,
                    MyClippers("HomeView_1"), MyClippers("HomeView_2"))
                .getHomeUI()));
  }
}
