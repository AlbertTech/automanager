import 'package:automanager/utilities/myClippers.dart';
import 'package:automanager/utilities/myColors.dart';
import 'package:automanager/view/loginUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '';

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
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: LoginUI(MyClippers(), MyColors().colorLightBlueBackground,
                    MyColors().colorLightorange, MyColors().colorDeepOrange)
                .getLoginUIWidget()));
  }
}
