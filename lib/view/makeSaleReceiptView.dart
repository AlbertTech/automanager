import 'package:automanager/resources/myColors.dart';
import 'package:automanager/view/makeSaleReceiptUI.dart';
import 'package:automanager/view_models/makeSaleReceiptViewModel.dart';
import 'package:flutter/material.dart';

class MakeSaleReceiptView extends StatefulWidget {
  final String stockId;
  final String categoryId;
  final String stockName;

  MakeSaleReceiptView(this.stockId, this.categoryId, this.stockName);

  @override
  _MakeSaleReceiptViewState createState() =>
      _MakeSaleReceiptViewState(this.stockId, this.categoryId, this.stockName);
}

class _MakeSaleReceiptViewState extends State<MakeSaleReceiptView> {


  _MakeSaleReceiptViewState(this.stockId, this.categoryId, this.stockName);

  final String stockId;
  final String categoryId;
  final String stockName;
  Map<int, String> myDropDownValues;
  MakeSaleReceiptViewModel makeSaleReceiptViewModel;
  int myDropDownSelectedValue;
  TextEditingController txtOrderType;
  TextEditingController txtOrderDate;
  TextEditingController txtCustomerName;
  TextEditingController txtCustomerLocation;
  TextEditingController txtQuantity;
  TextEditingController txtBalance;
  TextEditingController txtAge;
  TextEditingController txtGender;

  MyColors myColors;
  MakeSaleReceiptUI makeSaleReceiptUI;

  @override
  void initState() {
    myDropDownSelectedValue = 0;
    myDropDownValues = {
      0: "Select",
      1: "Male",
      2: "Female",
      3: "Others"
    };
    makeSaleReceiptViewModel = new MakeSaleReceiptViewModel();
    txtOrderType = new TextEditingController();
    txtOrderDate = new TextEditingController();
    txtCustomerName = new TextEditingController();
    txtCustomerLocation = new TextEditingController();
    txtQuantity = new TextEditingController();
    txtBalance = new TextEditingController();
    txtAge = new TextEditingController();
    txtGender = new TextEditingController();

    myColors = new MyColors();
    makeSaleReceiptUI = new MakeSaleReceiptUI(
        makeSaleReceiptViewModel,
        context,
        myColors.colorLightOrange,
        myColors.colorLightdark,
        this.txtOrderType,
        this.txtOrderDate,
        this.txtCustomerName,
        this.txtCustomerLocation,
        this.txtQuantity,
        this.txtBalance,
        this.txtAge,
        this.txtGender,
        this.stockId,
        this.categoryId,
        this.stockName,
        this.callBackDropDown,
        this.myDropDownSelectedValue,
    this.myDropDownValues);
    super.initState();
  }

  void callBackDropDown() {
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: makeSaleReceiptUI.getMakeSaleReceiptUI(),
        ));
  }
}
