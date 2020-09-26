import 'package:automanager/models/sharedPrefUtil.dart';
import 'file:///D:/Programming/Flutter_Projects/automanager/lib/utilities/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/myNavigatorUtil.dart';
import 'package:automanager/utilities/textFieldFocusUtilities.dart';
import 'package:automanager/view/loginUI.dart';
import 'package:automanager/view_models/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtil().clearValue();
  await Firebase.initializeApp();
  await LoginViewModel().fireAuthLogOut();
  runApp(LoginView());
}

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  SharedPrefUtil sharedPrefUtil;
  TextFieldFocusUtilities myTextUtility;
  MyColors myColors;
  MyClippers myClippers;
  LoginViewModel loginViewModel;
  TextEditingController txtEmail;
  TextEditingController txtPass;
  MyNavigatorUtil myNavigatorUtil;

  @override
  void initState() {
    sharedPrefUtil = new SharedPrefUtil();
    myTextUtility = new TextFieldFocusUtilities();
    myColors = new MyColors();
    myClippers = new MyClippers("LoginView");
    loginViewModel = new LoginViewModel();
    txtEmail = new TextEditingController();
    txtPass = new TextEditingController();
    myNavigatorUtil = new MyNavigatorUtil();
    super.initState();
  }

  @override
  void dispose() {
    txtEmail.dispose();
    txtPass.dispose();
    loginViewModel.fireAuthLogOut();
    print("hello dispose");
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
                  sharedPrefUtil,
                  loginViewModel,
                  myTextUtility,
                  myNavigatorUtil,
                  myClippers,
                  myColors.colorLightBlue,
                  myColors.colorLightOrange,
                  myColors.colorDeepOrange,
                  txtEmail,
                  txtPass)
              .getLoginUIWidget(),
        ));
  }
}
