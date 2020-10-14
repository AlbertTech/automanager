import 'package:automanager/models/sharedPrefUtil.dart';
import 'package:automanager/utilities/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/view/homeUI.dart';
import 'package:automanager/view_models/homeViewModel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> myImagePaths;
  MyColors myColors;
  MyClippers myClippers_1;
  MyClippers myClippers_2;
  HomeViewModel homeViewModel;
  HomeUI homeUI;

  @override
  void initState() {
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
    homeUI = new HomeUI(context, myImagePaths, myColors.colorLightBlue,
        myColors.colorLightOrange, myClippers_1, myClippers_2,homeViewModel);
    SharedPrefUtil()
        .getCurrentUserId()
        .then((value) => print("my uid: " + value.toString()));
    SharedPrefUtil()
        .getIsCurrentUserLoggedIn()
        .then((value) => print("isLoggedIn: " + value.toString()));
    super.initState();
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
            body: homeUI.getHomeUI()));
  }
}
