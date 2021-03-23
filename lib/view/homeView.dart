import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/resources/myHomeViewButtonTags.dart';
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
  HomeViewButtonTags homeViewButtonTags;
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
    homeViewButtonTags = new HomeViewButtonTags();
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
            body: getMyWidgetHomeUI()));
  }

  Widget getMyWidgetHomeUI() {
    return StreamBuilder<List>(
        stream: homeViewModel.getMyStreamDataSharedPref(),
        builder: (BuildContext ctx, AsyncSnapshot<List> asyncSnapshot) {
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
                    homeViewButtonTags,
                    txtControllerCreateDatabaseName,
                    txtControllerJoinDatabaseName,
                    ((asyncSnapshot.data[0].isNotEmpty)
                        ? asyncSnapshot.data[0]
                        : {}),
                    ((asyncSnapshot.data[1].isNotEmpty)
                        ? asyncSnapshot.data[1]
                        : []),
                    ((asyncSnapshot.data[2].toString().isNotEmpty &&
                            asyncSnapshot.data[2].toString() != "" &&
                            asyncSnapshot.data[2].toString() != " ")
                        ? asyncSnapshot.data[2].toString()
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
