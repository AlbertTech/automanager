import 'package:automanager/resources/myColors.dart';

import 'package:automanager/utilities/widgetForFab.dart';
import 'package:automanager/view/itemDisplayUI.dart';
import 'package:automanager/view_models/itemDisplayViewModel.dart';
import 'package:flutter/material.dart';

class ItemDisplayView extends StatefulWidget {
  @override
  _ItemDisplayViewState createState() => _ItemDisplayViewState();
}

class _ItemDisplayViewState extends State<ItemDisplayView> {
  List<String> mySelectedItemValues;
  ItemDisplayViewModel itemDisplayViewModel;
  TextEditingController txtMySearchBar;
  TextEditingController txtMyStockName;
  TextEditingController txtMyStockCategory;
  TextEditingController txtMyStockQuantity;
  TextEditingController txtMyStockPriceEach;
  TextEditingController txtMyDescriptionName;
  TextEditingController txtMyDescriptionValue;
  Map<String, String> mySuggestions;
  Map<String, dynamic> myDescriptions;
  List<String> myNewSuggestion;
  FocusNode myFocus;
  bool isRefreshed;
  MyColors myColors;

  ItemDisplayUI itemDisplayUI;

  @override
  void initState() {
    itemDisplayViewModel = new ItemDisplayViewModel();
    txtMySearchBar = new TextEditingController();
    txtMyStockName = new TextEditingController();
    txtMyStockCategory = new TextEditingController();
    txtMyStockQuantity = new TextEditingController();
    txtMyStockPriceEach = new TextEditingController();
    txtMyDescriptionName = new TextEditingController();
    txtMyDescriptionValue = new TextEditingController();
    mySuggestions = new Map();
    myNewSuggestion = new List();
    myDescriptions = new Map();
    mySelectedItemValues = new List();
    myFocus = new FocusNode();
    myColors = new MyColors();
    isRefreshed = false;
    itemDisplayUI = new ItemDisplayUI(
        context,
        itemDisplayViewModel,
        myColors.colorLightOrange,
        myColors.colorDeepOrange,
        myColors.colorLightdark,
        txtMySearchBar,
        txtMyStockName,
        txtMyStockCategory,
        txtMyStockQuantity,
        txtMyStockPriceEach,
        txtMyDescriptionName,
        txtMyDescriptionValue,
        mySuggestions,
        myNewSuggestion,
        myDescriptions,
        mySelectedItemValues,
        myFocus,
        isRefreshed,
        this.updateMyMaps,
        this.updateMySelectedItem);
    super.initState();
  }

  void updateMyMaps(Map thisMap, Map newMap, List myNewSuggestions) {
    setState(() {
      thisMap.addAll(newMap);
      myNewSuggestions.addAll(newMap.values.toList());
    });
  }

  void updateMySelectedItem(
      List<String> myViewingList,
      List<String> myUpdatedList,
      Map myDescriptions,
      Map myDescriptionsServer) {
    setState(() {
      myViewingList.addAll(myUpdatedList);
      myDescriptions.addAll(myDescriptionsServer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: itemDisplayUI.getItemDisplayUI(),
        ));
  }
}
