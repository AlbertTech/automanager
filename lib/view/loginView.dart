import 'package:automanager/utilities/myClippers.dart';
import 'package:automanager/utilities/myColors.dart';
import 'package:automanager/view/loginUI.dart';
import 'package:automanager/view/registerUI.dart';
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
  FocusNode _focus;
  bool textOnFocus;

  @override
  void initState() {
    super.initState();
    _focus = new FocusNode();
    textOnFocus = false;
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());
  }

  @override
  void dispose() {
    _focus.dispose();
    textOnFocus = false;
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
                    _focus,
                    textOnFocus,
                    MyClippers("LoginView"),
                    MyColors().colorLightBlueBackground,
                    MyColors().colorLightOrange,
                    MyColors().colorDeepOrange)
                .getLoginUIWidget()));
  }
}
