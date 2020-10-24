import 'dart:io';

import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/myClippers.dart';
import 'package:automanager/utilities/shadowClipper.dart';
import 'package:automanager/utilities/textFieldFocusUtilities.dart';
import 'package:automanager/utilities/widgetForFab.dart';
import 'package:automanager/view/AddStockUI.dart';
import 'package:automanager/view_models/addStockViewModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStockView extends StatefulWidget {
  @override
  _AddStockViewState createState() => _AddStockViewState();
}

class _AddStockViewState extends State<AddStockView> {
  AddStockUI addStockUI;
  AddStockViewModel addStockViewModel;
  TextFieldFocusUtilities textFieldFocusUtilities;
  ClipPathWithShadow clipPathWithShadow;
  MyColors myColors;
  WidgetForFab widgetForFab;
  UserInfoSharedPref sharedPrefUtil;
  TextEditingController txtDateOrder;
  TextEditingController txtDateArrival;
  TextEditingController txtDescriptionName;
  TextEditingController txtDescriptionValue;
  TextEditingController txtQuantity;
  TextEditingController txtStockName;
  TextEditingController txtCategory;
  TextEditingController txtDistributor;
  TextEditingController txtPrice;
  Map<String, String> myMapDesc;
  List<String> myCategorySuggestions;
  File imageFile;

  @override
  void initState() {
    addStockViewModel = new AddStockViewModel();
    textFieldFocusUtilities = new TextFieldFocusUtilities();
    myMapDesc = new Map();
    myCategorySuggestions = new List();
    txtDateOrder = new TextEditingController();
    txtDateArrival = new TextEditingController();
    txtDescriptionName = new TextEditingController();
    txtDescriptionValue = new TextEditingController();
    txtQuantity = new TextEditingController();
    txtStockName = new TextEditingController();
    txtCategory = new TextEditingController();
    txtDistributor = new TextEditingController();
    txtPrice = new TextEditingController();
    txtStockName = new TextEditingController();
    myColors = new MyColors();
    clipPathWithShadow = new ClipPathWithShadow(
        MyClippers("AddStockView"), myColors.colorLightOrange, 8, 0, -3);
    widgetForFab =
        new WidgetForFab(context, "AddStockView", myColors.colorDeepOrange);
    sharedPrefUtil = new UserInfoSharedPref();
    addStockUI = new AddStockUI(
        context,
        addStockViewModel,
        textFieldFocusUtilities,
        sharedPrefUtil,
        clipPathWithShadow.getWidget(),
        this.callBackMapDesc,
        this.callBackImages,
        myMapDesc,
        myCategorySuggestions,
        txtDateOrder,
        txtDateArrival,
        txtDescriptionName,
        txtDescriptionValue,
        txtQuantity,
        txtStockName,
        txtCategory,
        txtDistributor,
        txtPrice,
        myColors.colorDeepOrange,
        myColors.colorLightdark,
        imageFile);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void callBackImages(bool isGallery, File myImageFile, PickedFile pickedFile) {
    setState(() {
      if (isGallery == true) {
        print("making connection");
        myImageFile = new File(pickedFile.path);
      } else {}
    });
  }

  void callBackMapDesc(Map<String, String> myMap, String myKey, myValue) {
    setState(() {
      myMap.addAll({myKey: myValue});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: (ThemeData(brightness: Brightness.light)),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: addStockUI.getAddStockUI(),
      ),
    );
  }
}
