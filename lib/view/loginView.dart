import 'package:automanager/resources/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/textUtilities.dart';
import 'package:automanager/view/AddStockUI.dart';
import 'package:automanager/view/InventoryUI.dart';
import 'package:automanager/view/homeUI.dart';
import 'package:automanager/view/itemDisplayUI.dart';
import 'package:automanager/view/loginUI.dart';
import 'package:automanager/view/makeSaleUI.dart';
import 'package:automanager/view/registerUI.dart';
import 'package:automanager/view/rolesUI.dart';
import 'package:automanager/view/salesReportUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(LoginView());
}

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
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
            body: LoginUI(
                    TextUtilities(),
                    MyClippers("LoginView"),
                    MyColors().colorLightBlue,
                    MyColors().colorLightOrange,
                    MyColors().colorDeepOrange)
                .getLoginUIWidget(),));
  }
}
