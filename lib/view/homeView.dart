import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/view/homeUI.dart';
import 'package:automanager/view_models/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> myImagePaths;
  MyColors myColors;
  MyClippers myClippers_1;
  MyClippers myClippers_2;
  String myCurrentDatabase;
  TextEditingController txtControllerCreateDatabaseName;
  TextEditingController txtControllerJoinDatabaseName;
  HomeViewModel homeViewModel;
  HomeUI homeUI;

  @override
  void initState() {
    super.initState();
    print("now initializing");
    myCurrentDatabase = "empty";
    txtControllerCreateDatabaseName = new TextEditingController();
    txtControllerJoinDatabaseName = new TextEditingController();
    myImagePaths = [
      'assets/images/image_add_stock.png',
      'assets/images/image_make_sale.png',
      'assets/images/image_update_stock.png',
      'assets/images/image_view_sales.png',
      'assets/images/image_view_storage.png',
      'assets/images/image_view_roles.png',
    ];
    myColors = new MyColors();
    myClippers_1 = new MyClippers("HomeView_1");
    myClippers_2 = new MyClippers("HomeView_2");
    homeViewModel = new HomeViewModel();
    print("done initializing");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: getMyWidgetHomeUI()));
  }

  Widget getMyWidgetHomeUI() {
    return StreamBuilder<String>(
        stream: homeViewModel.getMyStreamDataSharedPref(),
        builder: (BuildContext ctx, AsyncSnapshot<String> asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            return new HomeUI(
                    this.context,
                    myImagePaths,
                    myColors.colorLightBlue,
                    myColors.colorLightOrange,
                    myColors.colorDeepOrange,
                    myClippers_1,
                    myClippers_2,
                    homeViewModel,
                    txtControllerCreateDatabaseName,
                    txtControllerJoinDatabaseName,
                    ((asyncSnapshot.data.toString().isNotEmpty &&
                            asyncSnapshot.data.toString() != "" &&
                            asyncSnapshot.data.toString() != " ")
                        ? asyncSnapshot.data.toString()
                        : "Tap to Create/Join"))
                .getHomeUI();
          } else {
            return Center(
              child: Text("Loading.."),
            );
          }
        });
  }
}
