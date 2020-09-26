
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/myClippers.dart';
import 'package:automanager/utilities/textFieldFocusUtilities.dart';
import 'package:automanager/view/registerUI.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextFieldFocusUtilities myTextUtility;
  MyColors myColors;
  TextEditingController txtCompleteName;
  TextEditingController txtEmail;
  TextEditingController txtPassword;
  TextEditingController txtConfirmPassword;
  GlobalKey formKey;
  @override
  void initState() {
    super.initState();
    myTextUtility = new TextFieldFocusUtilities();
    myColors = new MyColors();
    txtCompleteName = new TextEditingController();
    txtEmail = new TextEditingController();
    txtPassword = new TextEditingController();
    txtConfirmPassword = new TextEditingController();
    formKey  = new GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    txtCompleteName.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
    txtConfirmPassword.dispose();
    formKey.currentState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: RegisterUI(
              context,
              myTextUtility,
              myColors.colorDeepOrange,
              myColors.colorLightOrange,
              myColors.colorLightBlue,
              MyClippers("RegisterView_1"),
              MyClippers("RegisterView_2"),
              txtCompleteName,
              txtEmail,
              txtPassword,
              txtConfirmPassword,
              formKey
            ).getRegisterUI()));
  }
}
